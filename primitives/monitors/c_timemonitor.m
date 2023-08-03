classdef c_timemonitor < c_lumBaseObject
% Lumerical time monitor
% see: https://optics.ansys.com/hc/en-us/articles/360034902353-Field-time-monitor-Simulation-object
% supported by FDTD and MODE
% 
% author: bohan
%
% List of properties of the lumerical object
% returned when called ?get; on a time monitor model object:
% down sample X
% down sample Y
% down sample Z
% down sample time
% enabled
% min sampling per cycle
% monitor type
% name
% number of snapshots
% output Ex
% output Ey
% output Ez
% output Hx
% output Hy
% output Hz
% output Px
% output Py
% output Pz
% output power
% plugin material
% record data in pml
% sampling rate
% simulation type
% spatial interpolation
% start time
% stop method
% stop time
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
        
        model_type;
        name;          

    end     % end properties
    
    
    methods
        
        function obj = c_timemonitor( varargin )
            % constructor
            %
            % inputs:
            %   varargin = name value pairs
            %           where name must be one of the valid props
            
            % valid property names
            valid_props =   { ...
                            'down sample X', ...
                            'down sample Y', ...
                            'down sample Z', ...
                            'down sample time', ...
                            'enabled', ...
                            'min sampling per cycle', ...
                            'monitor type', ...
                            'name', ...
                            'number of snapshots', ...
                            'output Ex', ...
                            'output Ey', ...
                            'output Ez', ...
                            'output Hx', ...
                            'output Hy', ...
                            'output Hz', ...
                            'output Px', ...
                            'output Py', ...
                            'output Pz', ...
                            'output power', ...
                            'plugin material', ...
                            'record data in pml', ...
                            'sampling rate', ...
                            'simulation type', ...
                            'spatial interpolation', ...
                            'start time', ...
                            'stop method', ...
                            'stop time', ...
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
                        
            obj.model_type  = 'TimeMonitor';
            
        end     % end constructor()
        

    end     % end methods
    
end






































