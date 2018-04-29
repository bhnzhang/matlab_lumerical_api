classdef c_mesh < c_lumBaseObject
% Lumerical mesh object
% 
% author: bohan
%
% List of properties of the lumerical object
% returned when called ?set; on a FDTD model object:
% based on a structure
% buffer
% directly defined
% dx
% dy
% dz
% enabled
% equivalent x index
% equivalent y index
% equivalent z index
% name
% override x mesh
% override y mesh
% override z mesh
% set equivalent index
% set maximum mesh step
% set mesh multiplier
% structure
% type
% use relative coordinates
% x
% x max
% x mesh multiplier
% x min
% x span
% y
% y max
% y mesh multiplier
% y min
% y span
% z
% z max
% z mesh multiplier
% z min
% z span
    
    properties
        
        model_type;
        name;          

    end     % end properties
    
    
    methods
        
        function obj = c_mesh( varargin )
            % constructor
            %
            % inputs:
            %   varargin = name value pairs
            %           where name must be one of the valid props
            
            % valid property names
            valid_props =   { ...
                            'based on a structure', ...
                            'buffer', ...
                            'directly defined', ...
                            'dx', ...
                            'dy', ...
                            'dz', ...
                            'enabled', ...
                            'equivalent x index', ...
                            'equivalent y index', ...
                            'equivalent z index', ...
                            'name', ...
                            'override x mesh', ...
                            'override y mesh', ...
                            'override z mesh', ...
                            'set equivalent index', ...
                            'set maximum mesh step', ...
                            'set mesh multiplier', ...
                            'structure', ...
                            'type', ...
                            'use relative coordinates', ...
                            'x', ...
                            'x max', ...
                            'x mesh multiplier', ...
                            'x min', ...
                            'x span', ...
                            'y', ...
                            'y max', ...
                            'y mesh multiplier', ...
                            'y min', ...
                            'y span', ...
                            'z', ...
                            'z max', ...
                            'z mesh multiplier', ...
                            'z min', ...
                            'z span' ...
                            };

            obj = obj@c_lumBaseObject( valid_props, varargin{:} );
                        
            obj.model_type  = 'FiniteDifferenceTimeDomainSolver';
            obj.name        = 'FDTD';
            
        end     % end constructor()
        

    end     % end methods
    
end






































