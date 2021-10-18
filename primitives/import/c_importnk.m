classdef c_importnk < c_lumBaseObject
% Lumerical import index object
% 
% author: bohan
%
% List of properties of the lumerical object
% returned when called ?get; on a tfsf object:
% alpha
% binary threshold
% color opacity
% data x points
% data y points
% data z points
% detail
% dx
% dy
% dz
% enabled
% first axis
% grid attribute name
% hide_data
% import type
% index
% index units
% lower ref height
% material
% mesh order
% name
% not uniform scaling
% override color opacity from material database
% override mesh order from material database
% ref height span
% render type
% rotation 1
% rotation 2
% rotation 3
% second axis
% set color opacity from material database
% set mesh order from material database
% third axis
% threshold
% type
% uniform scaling
% upper ref height
% use relative coordinates
% x
% x max
% x min
% x scale
% x span
% y
% y max
% y min
% y scale
% y span
% z
% z max
% z min
% z scale
% z span
    
    properties
        
        model_type;
        name;          

    end     % end properties
    
    
    methods
        
        function obj = c_importnk( varargin )
            % constructor
            %
            % inputs:
            %   varargin = name value pairs
            %           where name must be one of the valid props
            
            % valid property names
            valid_props =   { ...
                            'alpha', ...
                            'binary threshold', ...
                            'color opacity', ...
                            'data x points', ...
                            'data y points', ...
                            'data z points', ...
                            'detail', ...
                            'dx', ...
                            'dy', ...
                            'dz', ...
                            'enabled', ...
                            'first axis', ...
                            'grid attribute name', ...
                            'hide_data', ...
                            'import type', ...
                            'index', ...
                            'index units', ...
                            'lower ref height', ...
                            'material', ...
                            'mesh order', ...
                            'name', ...
                            'not uniform scaling', ...
                            'override color opacity from material database', ...
                            'override mesh order from material database', ...
                            'ref height span', ...
                            'render type', ...
                            'rotation 1', ...
                            'rotation 2', ...
                            'rotation 3', ...
                            'second axis', ...
                            'set color opacity from material database', ...
                            'set mesh order from material database', ...
                            'third axis', ...
                            'threshold', ...
                            'type', ...
                            'uniform scaling', ...
                            'upper ref height', ...
                            'use relative coordinates', ...
                            'x', ...
                            'x max', ...
                            'x min', ...
                            'x scale', ...
                            'x span', ...
                            'y', ...
                            'y max', ...
                            'y min', ...
                            'y scale', ...
                            'y span', ...
                            'z', ...
                            'z max', ...
                            'z min', ...
                            'z scale', ...
                            'z span' ...
                            };

            obj = obj@c_lumBaseObject( valid_props, varargin{:} );
                        
            obj.model_type  = 'Import';
            
        end     % end constructor()
        

    end     % end methods
    
end






































