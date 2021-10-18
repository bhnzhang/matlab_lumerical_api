classdef c_structuregroup < c_lumBaseObject
% Lumerical structure group object
% 
% author: bohan
%
% List of properties of the lumerical object
% returned when called ?set; on object:
% enabled
% first axis
% name
% rotation 1
% rotation 2
% rotation 3
% script
% second axis
% third axis
% type
% use relative coordinates
    
    properties
        
        model_type;
        name; 

    end     % end properties
    
    
    methods
        
        function obj = c_structuregroup( varargin )
            % constructor
            %
            % inputs:
            %   varargin = name value pairs
            %           where name must be one of the valid props
            
            % valid property names
            valid_props =   {
                            'enabled', ...
                            'first axis', ...
                            'name', ...
                            'rotation 1', ...
                            'rotation 2', ...
                            'rotation 3', ...
                            'script', ...
                            'second axis', ...
                            'third axis', ...
                            'type', ...
                            'use relative coordinates' ...
                            };
            
            obj = obj@c_lumBaseObject( valid_props, varargin{:} );
                        
            obj.model_type = 'Structure Group';     % even though this is a triangle, fdtd seems to model this as a polygon anyways
            
        end     % end constructor()
        

    end     % end methods
    
end





































