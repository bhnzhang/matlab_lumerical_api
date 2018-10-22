classdef c_lumericalFDTD < c_lumericalBase
% matlab -> lumerical FDTD solutions API class
%
% author: bohan
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
        
    end     % end properties
    
    
    methods
        
        
        function obj = c_lumericalFDTD( varargin )
            % constructor
            
            % call superclass constructor
            obj = obj@c_lumericalBase( varargin{:} );

        end     % end c_lumericalFDTD()
        

        function obj = appopen(obj)
            % opens FDTD app
            obj.app_handle = appopen('fdtd');
        end
        
        
        function obj = addfdtd(obj, varargin)
            % adds a FDTD solver region to the
            % lumerical model
            %
            % Inputs:
            %   varargin
            %       Name-value pairs of form 'property name', property value
            %       See the primitives/c_FDTD.m class for valid properties
            %
            % Example:

            
            % add lumerical object
            new_FDTD                = c_FDTD( varargin{:} );
            obj.lum_objects{end+1}  = new_FDTD;
            
            % add fdtd
            obj = obj.write_command( 'addfdtd;' );
            
            % set fdtd properties
            obj = obj.set_lum_object_properties( new_FDTD );
            
        end     % end addfdtd()
        
        % ---------------------------
        % Structure functions
        % ---------------------------

        
        % ---------------------------
        % Source functions
        % ---------------------------
        
        function obj = addtfsf(obj, varargin)
            % adds a TFSF source
            %
            % Inputs:
            %   varargin
            %       Name-value pairs of form 'property name', property value
            %       See the primitives/c_tfsf.m class for valid properties
            %
            % Example:

            
            % add lumerical object
            new_obj                 = c_tfsf( varargin{:} );
            obj.lum_objects{end+1}  = new_obj;
            
            % add command
            obj = obj.write_command( 'addtfsf;' );
            
            % set properties
            obj = obj.set_lum_object_properties( new_obj );
            
        end     % end addtfsf()
        
        
        function obj = addmode(obj, varargin)
            % adds a mode source
            %
            % Inputs:
            %   varargin
            %       Name-value pairs of form 'property name', property value
            %       See the primitives/c_modesource.m class for valid properties
            %
            % Example:

            
            % add lumerical object
            new_obj                 = c_modesource( varargin{:} );
            obj.lum_objects{end+1}  = new_obj;
            
            % add command
            obj = obj.write_command( 'addmode;' );
            
            % set properties
            obj = obj.set_lum_object_properties( new_obj );
            
        end     % end addmode()

        % ---------------------------
        % Monitor functions
        % ---------------------------
        
        function obj = addpower(obj, varargin)
            % adds a frequency domain, field and power monitor to the
            % simulation
            %
            % Inputs:
            %   varargin
            %       Name-value pairs of form 'property name', property value
            %       See the primitives/c_indexmonitor.m class for valid properties
            %
            % Example:
            
            % add lumerical object
            new_obj                 = c_field_and_power_monitor( varargin{:} );
            obj.lum_objects{end+1}  = new_obj;
            
            % lumerical command
            obj = obj.write_command( 'addpower;' ); 
            
            % set properties
            obj = obj.set_lum_object_properties( new_obj );
            
        end     % end addindex()
        
        % ---------------------------
        % Misc. functions
        % ---------------------------
        
        % Functions for importing a custom index distribution into
        % lumerical
        
        function obj = import_index_to_lumerical( obj, N, units, x, y, z )
            % Imports index distribution N into lumerical
            % This is the function the end user will want to call
            %
            % Calls obj.write_index_to_txt and then calls obj.importnk
            %
            % currently only does 2D, isotropic index (can be complex)
            %
            % Inputs
            %   N
            %       desc: Index distribution.
            %             If 2D simulation, dimensions are y vs x (x is
            %             propagation direction)
            %             If 3D simulation, dimensions are ?? Not
            %             implemented, but I think will be x vs y vs z
            %   units
            %       type: string
            %       desc: specifies spatial units, either 'm', 'cm', 'mm',
            %             'microns', or 'nm'
            %   x
            %       type: double, array
            %       desc: x coordinate array
            %   y
            %       type: double, array
            %       desc: y coordinate array
            %   z
            %       type: double, array
            %       desc: z coordinate array, optional (only needed for 3d
            %             simulations)
            
            if nargin < 6
                is_2d = true;
            else
                is_2d = false;
            end
            
            % default filename
            filename = 'N.txt';
            
            % write index to txt file
            if is_2d
                obj = obj.write_index_to_txt( filename, N, x, y );
            else
                obj = obj.write_index_to_txt( filename, N, x, y, z );
            end
            
            % import object to lumerical
            obj = obj.importnk( [ pwd filesep filename ], units, 0, 0, 0, 0 );
            
        end
        
        function obj = write_index_to_txt(obj, filename, N, x, y, z)
            % Stitches together synthesized index distribution and saves
            % results to text file for Lumerical FDTD to read
            %
            % Currently only does 2D, isotropic index
            %
            % Inputs
            %   filename
            %       type: string
            %       desc: name of file to save to (on current path)
            %   N
            %       type: double, matrix
            %       desc: Index distribution.
            %             If 2D simulation, dimensions are y vs x (x is
            %             propagation direction)
            %             If 3D simulation, dimensions are ?? Not
            %             implemented, but I think will be x vs y vs z
            %   x
            %       type: double, array
            %       desc: x coordinate array
            %   y
            %       type: double, array
            %       desc: y coordinate array
            %   z
            %       type: double, array
            %       desc: z coordinate array, optional (only needed for 3d
            %             simulations)
            %
            % Outputs
            %   a text file with the index distribution formatted for
            %   reading into lumerical
            
            if nargin < 6
                is_2d_sim = true;
            else
                is_2d_sim = false;
            end
            
            % open file
            txt_fname   = [ obj.file_directory filesep filename ];
            N_txt_fid   = fopen( txt_fname, 'wt+' );
            
            if is_2d_sim   
                % 2D simulation
                
                % write header
                fprintf( N_txt_fid, '%s\n', [ num2str(length(x)) ' ' num2str(x(1)) ' ' num2str(x(end)) ] );     % x coordinates
                fprintf( N_txt_fid, '%s\n', [ num2str(length(y)) ' ' num2str(y(1)) ' ' num2str(y(end)) ] );     % y coordinates
                fprintf( N_txt_fid, '%s\n', [ num2str(2) ' ' num2str(0) ' ' num2str(1) ] );                     % z coordinates, dummy in 2D
                
                % unwrap index
                N = N.';                                                    % first must transpose (now dimensions are x vs y)
                N = N(:);                                                   % now unwrap columns first
                N = [ N; N ];                                               % double the length for z
                
                % separate real and imag
                N_real = real(N).';
                N_imag = imag(N).';
                
                % interleave into one array
                N_interleaved = [ N_real; N_imag ];
                N_interleaved = N_interleaved(:).';
                
                % write index
%                 N_str = sprintf( '%.3f %.3f\n', N_interleaved );
                
%                 N_str = sprintf('');
%                 for ii = 1:length(N)
%                     fprintf( N_txt_fid, '%s\n', [ num2str( real(N(ii)) ) ' ' num2str( imag(N(ii)) ) ] );
% %                       N_str = sprintf( '%s%s\n', N_str, [ num2str( real(N(ii)) ) ' ' num2str( imag(N(ii)) ) ] );
%                 end
                fprintf( N_txt_fid, '%s', sprintf( '%.3f %.3f\n', N_interleaved ) );
                
            end     % end if
            
            % close file
            status = fclose( N_txt_fid );
            
        end     % end write_index_to_txt() 
        
        
        function obj = importnk( obj, filename, file_units, x0, y0, z0, reverse_index_order )
            % Imports an index distribution text file into Lumerical
            % See for additional documentation:
            % https://kb.lumerical.com/en/ref_scripts_importnk.html
            %
            % Inputs:
            %   filename
            %       type: string
            %       desc: name of file to load (and path if not on current
            %             path)
            %   file_units
            %       type: string
            %       desc: specifies spatial units, either 'm', 'cm', 'mm',
            %             'microns', or 'nm'
            %   x0
            %       type: double, scalar
            %       desc: data origin in global coordinates
            %   y0
            %       type: double, scalar
            %       desc: data origin in global coordinates
            %   z0
            %       type: double, scalar
            %       desc: data origin in global coordinates
            %   reverse_index_order
            %       type: 0 or 1
            %       desc: set to 1 to reverse how indices are interpreted.
            %             Set to 0 in most scenarios
            
            % add lumerical object
            new_obj                 = c_importnk();
            obj.lum_objects{end+1}  = new_obj;
            
            % lumerical command
            obj = obj.write_command( 'addimport;' );
            obj = obj.write_command( [ 'importnk(''' filename ''',''' file_units ''',' ...
                                       num2str(x0) ',' num2str(y0) ',' num2str(z0), ...
                                       ',' num2str(reverse_index_order) ');' ] ); 
            
            
        end     % end importnk()
        
        
    end     % end methods
    
    
end     % end class















































