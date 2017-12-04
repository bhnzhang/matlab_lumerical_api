classdef c_rect < c_lumBaseObject
% Lumerical rectangle object
% 
% author: bohan
%
% List of properties of the lumerical object
% returned when called ?set; on a rectangle object:
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
% x
% x max
% x min
% x span
% y
% y max
% y min
% y span
% z
% z max
% z min
% z span
    
    properties
        
        object_type;

    end     % end properties
    
    
    methods
        
        function obj = c_rect( varargin )
            % constructor
            %
            % inputs:
            %   varargin = name value pairs
            %           where name must be one of the valid props
            
            % valid property names
            valid_props =   {
                            'alpha', ...
                            'color opacity', ...
                            'detail', ...
                            'enabled', ...
                            'first axis', ...
                            'grid attribute name', ...
                            'index', ...
                            'index units', ...
                            'material', ...
                            'mesh order', ...
                            'name', ...
                            'override color opacity from material database', ...
                            'override mesh order from material database', ...
                            'render type', ...
                            'rotation 1', ...
                            'rotation 2', ...
                            'rotation 3', ...
                            'second axis', ...
                            'set color opacity from material database', ...
                            'set mesh order from material database', ...
                            'third axis', ...
                            'type', ...
                            'use relative coordinates', ...
                            'x', ...
                            'x max', ...
                            'x min', ...
                            'x span', ...
                            'y', ...
                            'y max', ...
                            'y min', ...
                            'y span', ...
                            'z', ...
                            'z max', ...
                            'z min', ...
                            'z span' ...
                            };
            
            obj = obj@c_lumBaseObject( valid_props, varargin{:} );
                        
%             % set inputs
%             for ii = 1:2:length(varargin)
%                 if ~any( strcmp( valid_props, varargin{ii} ) )
%                     % property is valid, set the value
%                     obj.props.(varargin{ii}) = varargin{ii+1};
%                 else
%                     % spit a warning
%                     warning('Property %s is not a valid property of the rectangle object', varargin{ii});
%                 end
%             end
            
        end     % end constructor()
        

    end     % end methods
    
end





































