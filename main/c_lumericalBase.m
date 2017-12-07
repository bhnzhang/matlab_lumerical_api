classdef (Abstract) c_lumericalBase
% base class of lumerical api
% authors: bohan zhang
%
% Inputs:
%   'notes'
%       type: string
%       desc: whatever notes the user wants to save
%   'filename'
%       type: string
%       desc: name of lsf file to open
%   'file_directory'
%       type: string
%       desc: directory of lsf file to open
    
    properties
        
        inputs;             % cell array holding the inputs and their defaults
        start_time;         % starting time of object creation in format year_month_dday hour_minute_second
        filename;           % name of lsf file to open
        file_directory;     % name of directory of lsf file to open
        fid;                % file id of open lsf file
        app_handle;         % handle to opened application
        lum_objects;        % cell array of lumerical objects
        text_buffer;        % string that saves the written lsf text commands
        
    end     % end properties
    
    
    methods
        
        function obj = c_lumericalBase( varargin )
            % Constructor
            
            % add path to primitive objects
            addpath([ '..' filesep 'primitives' ]);
            
            % inputs and defaults
            inputs = {  'notes',            'none' ...
                        'filename',         'none', ...
                        'file_directory',   'none' ...
                     }; 
            obj.inputs = inputs;

            % parse inputs
            p = f_parse_varargin( inputs, varargin{:} );

            % save starting time
            obj.start_time = datestr( datetime('now'), 'yyyy_mm_dd HH_MM_SS ' );
            
            % set inputs
            obj.filename        = p.filename;
            obj.file_directory  = p.file_directory;
            
            % open a fresh lsf file
            obj = obj.open_lsf_file( 'wt+' );
            obj = obj.close_lsf_file();
            
            % init empty text buffer
            obj.text_buffer = '';
            
        end     % end contructor()
        
        
        function obj = open_lsf_file( obj, filemode )
            % open the lsf file
            %
            % inputs:
            %   filemode
            %       type: string
            %       desc: Flag that identifies how the file should be
            %             opened. 'r' for read, 'w' for overwrite, 'a' for append
            
            [ obj.fid, err_msg ] = fopen( [obj.file_directory filesep obj.filename], [ filemode, 't+' ] );     % open in desired mode
            if obj.fid == -1
                % error in opening file
                error('opening lsf file failed with message: %s', err_msg);
            end
            
        end     % end open_lsf_file()
        
        
        function obj = close_lsf_file( obj )
            % close the lsf file
            
            status = fclose( obj.fid );     % open in append mode
            if status ~= 0
                % close file failed
                warning('Closing lsf file failed');
            end
            
        end     % end close_lsf_file()
        
        
        function obj = write_to_lsf_file( obj, text )
            % writes (in append mode) a line of text to lsf file
            % open lsf file-> write text ->close lsf file
            %
            % inputs:
            %   text
            %       type: string
            %       desc: text to write
            
            % open lsf
            obj = obj.open_lsf_file( 'a' );
            
            % write to file
            fprintf( obj.fid, '%s\n', text );
            
            % close file
            obj = obj.close_lsf_file();
            
            % write text to the buffer
            obj.text_buffer = sprintf( '%s%s\n', obj.text_buffer, text );
            
        end     % end write_to_lsf_file()
        
        
        function obj = execute_script( obj )
            % execute entire .lsf script
            
            % grab lsf script text
            script_contents = fileread( [ obj.file_directory filesep obj.filename ] );
            
            % run script
            appevalscript( obj.app_handle, script_contents );
            
        end     % end execute_script()
        
        
        function obj = appclose(obj)
            % closes MODE app
            appclose( obj.app_handle );
        end     % end appclose()
        
        
        function obj = addrect(obj, varargin)
            % adds a rectangle object to the script/lumerical program
            %
            % Inputs:
            %   varargin
            %       Name-value pairs of form 'property name', property value
            %       See the primitives/c_rect.m class for valid properties
            %
            % Example:
            %   obj = obj.addrect( 'name', 'timmy', 'x', 1e-6 );
            %       Draws a rectangle in lumerical, set it's name to 'timmy' and
            %       it's x position to 1e-6
            %       The equivalent lumerical commands are:
            %           addrect;
            %           set('name','timmy');
            %           set('x', 1e-6);  
            
            % add lumerical object
            new_rect               = c_rect( varargin{:} );
            obj.lum_objects{end+1} = new_rect;
            
            % add rectangle
            obj = obj.write_to_lsf_file( 'addrect;' );
            
            % set rectangle properties
            obj = obj.set_lum_object_properties( new_rect );
            
            
        end     % end addrect()
        
        
        function obj = setprop(obj, prop_name, prop_val)
            % adds a set property command in lumerical
            %
            % inputs:
            %   prop_name
            %       type: string
            %       desc: name of property to set
            %   prop_val
            %       type: string or value
            %       desc: value of the property to set
            %
            % examples:
            %   Execute the lumerical command: "set('name,'timmy');"
            %       obj = obj.setprop('name', 'timmy');
            %   Execute the lumerical command: "set('x',1e-6);"
            %       obj = obj.setprop('x', 1e-6');
            
            if ischar(prop_val)
                % property value is a string
                obj = obj.write_to_lsf_file( sprintf('set(''%s'', ''%s'');', prop_name, prop_val ) );
            else
                obj = obj.write_to_lsf_file( [ 'set(''' prop_name ''', ' num2str(prop_val), ');' ] );
            end

        end
        
        
        function obj = set_lum_object_properties(obj, lum_object)
            % sets all user-defined properties of a lumerical model object
            %
            % Inputs:
            %   lum_object
            %       type: c_lumBaseObject (or subclass)
            %       desc: lumerical object with properties to set
            %
            % Example:
            %   new_rect = c_rect( 'name', 'timmy' );
            %   obj      = set_lum_object_properties( new_rect );
            %       This is equivalent to adding the following line of
            %       lumerical script:
            %           set('name', 'timmy');
            %       CAVEAT: it does NOT add a rectangle and it DOES assume
            %       that the intended lumerical model object is already selected
            
            % set properties if any
            props_to_set = fieldnames( lum_object.props );
            for ii = 1:length(props_to_set)
                % set properties
                prop_val    = lum_object.props.(props_to_set{ii});
                obj         = obj.setprop( strrep( props_to_set{ii}, '_', ' ' ), prop_val);
            end
            
        end
        
        
        function obj = addcomment(obj, comment)
            % adds a comment to the lumerical script
            %
            % inputs:
            %   comment
            %       type: string
            %       desc: comment to add
            
            obj = obj.write_to_lsf_file( sprintf('# %s', comment) );
            
        end     % end addcomment()
            
        
    end     % end methods
    
    
    methods (Abstract)
        % ABSTRACT METHODS
        % these methods must be implemented by the child classes
        
        % open the app
        appopen(obj);
        
    end     % end abstract methods
    
end


% -------------------------------------------------------------------------
% Auxiliary functions
% -------------------------------------------------------------------------

function parsed_inputs = f_parse_varargin( inputs, varargin )
% Parses varargin along with a list of inputs, and
% fills in a parsed_inputs structure.
%
% authors: bohan
%
% "inputs" is a cell array of name-value pairs that holds the
% names and default values of inputs. Inputs with a default
% value of 'none' will be required to have values specified by
% the user, meaning that those inputs must be specified by
% varargin. Varargin will of course override default values.
%
% Inputs:
%   inputs
%       Type: cell array
%       Desc: Cell array of name-value pairs of required
%             inputs.
%             The array looks like { 'input1_name',
%             <default_val1>, 'input2_name', <default_val2>, ...
%             'inputn_name', <default_valn> }
%   varargin
%       Name-value pairs of inputs
% 
% Outputs:
%   parsed_inputs
%       Type: struct
%       Desc: Struct with fields named after inputs, with
%             values set by varargin or by the defaults
%
% Example:
%       inputs          = { 'notes', 'none' };
%       varargin        = { 'notes', 'hello' };
%       parsed_inputs   = f_parse_varargin( inputs, varargin )
%       parsed_inputs = 
%           struct with fields:
%             notes: 'hello'

% parse the inputs
p = struct();
for ii = 1:2:length(varargin)-1
    p.(varargin{ii}) = varargin{ii+1}; % = setfield( p, varargin{ii}, varargin{ii+1} );
end

% check existence of required inputs
for ii = 1:2:( length(inputs)-1 )

    if ~isfield( p, inputs{ii} )
        % this input was not found

        if ischar( inputs{ii+1} )
            if strcmp( inputs{ii+1}, 'none' )
                % this input has no default, throw error
                error( 'Input ''%s'' was not set and requires a user-defined value. Try again.', inputs{ii} );
            end
        else
            % this input has a default, set the default
            fprintf( 'Input ''%s'' was not set, setting to default value ''%s''\n', inputs{ii}, num2str(inputs{ii+1}) );
            p.(inputs{ii}) = inputs{ii+1};
        end

    end     % end if ~isfield

end     % end for loop

parsed_inputs = p;

end     % end parse varrgin







