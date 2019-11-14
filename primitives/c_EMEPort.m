classdef c_EMEPort < c_lumBaseObject
% Lumerical port object of EME simulation object
% 
% author: bohan
%
% List of properties of the lumerical object
% returned when called ?set; on a port object:
% auto update before analysis
% down sample X
% down sample Y
% down sample Z
% enabled
% mode selection
% monitor type
% name
% offset
% phi
% port location
% record data in pml
% spatial interpolation
% theta
% type
% use full simulation span
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
        
        model_type;
        name; 

    end     % end properties
    
    
    methods
        
        function obj = c_EMEPort( varargin )
            % constructor
            %
            % inputs:
            %   varargin = name value pairs
            %           where name must be one of the valid props
            
            % valid property names
            valid_props =   {
                            'auto update before analysis', ...
                            'down sample X', ...
                            'down sample Y', ...
                            'down sample Z', ...
                            'enabled', ...
                            'mode selection', ...
                            'monitor type', ...
                            'name', ...
                            'offset', ...
                            'phi', ...
                            'port location', ...
                            'record data in pml', ...
                            'spatial interpolation', ...
                            'theta', ...
                            'type', ...
                            'use full simulation span', ...
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
                        
            obj.model_type = 'EMEPort';
            
        end     % end constructor()
        

    end     % end methods
    
end





































