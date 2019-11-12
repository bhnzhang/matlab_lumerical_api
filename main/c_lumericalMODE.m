classdef c_lumericalMODE < c_lumericalBase
% matlab -> lumerical MODE solutions API class
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
        
        
        function obj = c_lumericalMODE( varargin )
            % constructor
            
            % call superclass constructor
            obj = obj@c_lumericalBase( varargin{:} );

        end     % end c_lumericalMODE()
        

        function obj = appopen(obj)
            % opens MODE app
            obj.app_handle = appopen('mode');
        end
        
        
        function obj = addFDE(obj, varargin)
            % adds a FDE (finite difference eigenmode) solver to the
            % lumerical model
            %
            % Inputs:
            %   varargin
            %       Name-value pairs of form 'property name', property value
            %       See the primitives/c_FDE.m class for valid properties
            %
            % Example:
            % obj = obj.addFDE(   'x min', -3e-6, 'x max', 3e-6,  ...
            %                     'y min', -3.5e-6, 'y max', 3.5e-6,  ...
            %                     'solver type', '2D Z normal',   ...
            %                     'x min bc', 'PML', ...
            %                     'x max bc', 'PML', ...
            %                     'y min bc', 'PML', ...
            %                     'y max bc', 'PML' );

            
            % add lumerical object
            new_FDE                 = c_FDE( varargin{:} );
            obj.lum_objects{end+1}  = new_FDE;
            
            % add fde
            obj = obj.write_command( 'addfde;' );
            
            % set fde properties
            obj = obj.set_lum_object_properties( new_FDE );
            
        end     % end addFDE()
        
        
        function obj = addEME(obj, varargin)
            % adds an EME (eigenmode expansion) solver to the
            % lumerical model
            %
            % Inputs:
            %   varargin
            %       Name-value pairs of form 'property name', property value
            %       See the primitives/c_EME.m class for valid properties
            %
            % Example:

            
            % add lumerical object
            new_obj                 = c_EME( varargin{:} );
            obj.lum_objects{end+1}  = new_obj;
            
            % add eme
            obj = obj.write_command( 'addeme;' );
            
            % set eme properties
            obj = obj.set_lum_object_properties( new_obj );
            
        end     % end addEME()
        
        
        function obj = addEMEMonitor(obj, varargin)
            % adds an EME profile monitor to the
            % lumerical model
            %
            % Inputs:
            %   varargin
            %       Name-value pairs of form 'property name', property value
            %       See the primitives/c_EMEMonitor.m class for valid properties
            %
            % Example:

            % add lumerical object
            new_obj                 = c_EMEMonitor( varargin{:} );
            obj.lum_objects{end+1}  = new_obj;
            
            % add eme monitor
            obj = obj.write_command( 'addemeprofile;' );
            
            % set properties
            obj = obj.set_lum_object_properties( new_obj );
            
        end     % end addEMEMonitor()
        
        
        function obj = findmodes(obj)
            % finds modes
            % to set the inputs, set them with the FDE object before
            % calling the modesolver
            obj = obj.write_command( 'findmodes;' );
        end
        
        
        function obj = setEMEPort(obj, port_number, varargin)
            % Sets properties of EME port objects
            % assumes user has already created an EME simulation object
            %
            % Inputs:
            %   port_number
            %       type: int
            %       desc: either 1 or 2
            %   varargin
            %       Name-value pairs of form 'property name', property value
            %       See the primitives/c_EMEPort.m class for valid properties
            %
            % Example:
            
            % first select the port
            obj = obj.write_command( sprintf( "select('EME::Ports::port_%i');", port_number) );
            
            % set port properties
            obj = obj.set_lum_object_properties( c_EMEPort( varargin{:} ) );
            
        end     % end function setEMEPort()

        
        function obj = set_eme_analysis(obj, varargin)
            % Sets properties of eme analysis window
            %
            % Inputs:
            %   varargin
            %       Name-value pairs of form 'property name', property value
            %       See the primitives/c_EMEAnalysis.m class for valid properties
            %
            % Example:
            
            for ii = 1:2:length(varargin)-1
                % set properties
                prop_name   = varargin{ii};
                prop_val    = varargin{ii+1};
                
                if ischar(prop_val)
                    % property value is a string
                    obj = obj.write_command( sprintf('setemeanalysis(''%s'', ''%s'');', prop_name, prop_val ) ); 
                else
                    % property value is numeric
                    obj = obj.write_command( [ 'setemeanalysis(''' prop_name ''', ' regexprep( mat2str(prop_val, 10), {'\s+'}, {','} ) ');' ] ); 
                end
                
            end     % end for varargin
            
        end     % end set_eme_analysis()
        
        
        function [obj, val] = get_eme_analysis(obj, property)
            % Queries and returns values of requested property from eme
            % analysis window
            %
            % Inputs:
            %   property
            %       type: str
            %       desc: name of property to get
            %
            % Example:
            
            obj = obj.write_command( sprintf('tempvar = getemeanalysis("%s");', property) );
            obj = obj.execute_commands();
            
            [obj,val] = obj.getvar( 'tempvar' );
            
        end
        
        
        function obj = eme_propagate(obj)
            % tells eme to propagate
            obj = obj.write_command('emepropagate;');
            obj = obj.execute_commands();
        end
        
        
    end     % end methods
    
    
end





























