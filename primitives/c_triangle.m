classdef c_triangle < c_lumBaseObject
% Lumerical triangle object
% 
% author: bohan
%
% List of properties of the lumerical object
% returned when called ?set; on object:
% alpha
% color opacity
% detail
% enabled
% first axis
% grid attribute name
% index
% index units
% material
% mesh order
% name
% override color opacity from material database
% override mesh order from material database
% render type
% rotation 1
% rotation 2
% rotation 3
% second axis
% set color opacity from material database
% set mesh order from material database
% third axis
% type
% use relative coordinates
% vertices
% x
% y
% z
% z max
% z min
% z span
    
    properties
        
        model_type;
        name; 

    end     % end properties
    
    
    methods
        
        function obj = c_triangle( varargin )
            % constructor
            %
            % inputs:
            %   varargin = name value pairs
            %           where name must be one of the valid props
            
            % valid property names
            valid_props =   {
                            'alpha',...
                            'color opacity',...
                            'detail',...
                            'enabled',...
                            'first axis',...
                            'grid attribute name',...
                            'index',...
                            'index units',...
                            'material',...
                            'mesh order',...
                            'name',...
                            'override color opacity from material database',...
                            'override mesh order from material database',...
                            'render type',...
                            'rotation 1',...
                            'rotation 2',...
                            'rotation 3',...
                            'second axis',...
                            'set color opacity from material database',...
                            'set mesh order from material database',...
                            'third axis',...
                            'type',...
                            'use relative coordinates',...
                            'vertices',...
                            'x',...
                            'y',...
                            'z',...
                            'z max',...
                            'z min',...
                            'z span'...
                            };
            
            obj = obj@c_lumBaseObject( valid_props, varargin{:} );
                        
            obj.model_type = 'Polygon';     % even though this is a triangle, fdtd seems to model this as a polygon anyways
            
        end     % end constructor()
        

    end     % end methods
    
end





































