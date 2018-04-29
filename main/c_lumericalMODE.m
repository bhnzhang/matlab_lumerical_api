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
        
        
        function obj = findmodes(obj)
            % finds modes
            % to set the inputs, set them with the FDE object before
            % calling the modesolver
            obj = obj.write_command( 'findmodes;' );
        end

        
    end     % end methods
    
    
end

