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

        end     % end c_lumericalMODE()
        

        function obj = appopen(obj)
            % opens MODE app
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
            
            % add fdtd
            obj = obj.write_command( 'addtfsf;' );
            
            % set fdtd properties
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
            
            % add fdtd
            obj = obj.write_command( 'addmode;' );
            
            % set fdtd properties
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
        
        
    end     % end methods
    
    
end


