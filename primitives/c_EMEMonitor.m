classdef c_EMEMonitor < c_lumBaseObject
% Lumerical EME Monitor object
% 
% author: bohan
%
% List of properties of the lumerical object
% returned when called ?set; on an EME monitor object:
% down sample X
% down sample Y
% down sample Z
% enabled
% monitor type
% name
% record data in pml
% spatial interpolation
% type
% use relative coordinates
% x
% x max
% x min
% x resolution
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
        
        function obj = c_EMEMonitor( varargin )
            % constructor
            %
            % inputs:
            %   varargin = name value pairs
            %           where name must be one of the valid props
            
            % valid property names
            valid_props =   {
                            'down sample X', ...
                            'down sample Y', ...
                            'down sample Z', ...
                            'enabled', ...
                            'monitor type', ...
                            'name', ...
                            'record data in pml', ...
                            'spatial interpolation', ...
                            'type', ...
                            'use relative coordinates', ...
                            'x', ...
                            'x max', ...
                            'x min', ...
                            'x resolution', ...
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
                        
            obj.model_type = 'EMEProfileMonitor';
            
        end     % end constructor()
        

    end     % end methods
    
end





































