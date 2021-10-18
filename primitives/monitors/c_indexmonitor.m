classdef c_indexmonitor < c_lumBaseObject
% Lumerical index monitor object
% supported in FDTD and MODE
% 
% author: bohan
%
% List of properties of the lumerical object
% returned when called ?get; on a index monitor model object:
% Nyquist limit
% actual sampling
% desired sampling
% down sample X
% down sample Y
% down sample Z
% down sample time
% enabled
% frequency center
% frequency points
% frequency span
% maximum frequency
% maximum wavelength
% min sampling per cycle
% minimum frequency
% minimum wavelength
% monitor type
% name
% override advanced global monitor settings
% override global monitor settings
% record conformal mesh when possible
% record surface conductivity
% record_data_in_pml
% simulation type
% spatial interpolation
% type
% use linear wavelength spacing
% use relative coordinates
% use source limits
% wavelength center
% wavelength span
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
        
        function obj = c_indexmonitor( varargin )
            % constructor
            %
            % inputs:
            %   varargin = name value pairs
            %           where name must be one of the valid props
            
            % valid property names
            valid_props =   { ...
                            'Nyquist limit', ...
                            'actual sampling', ...
                            'desired sampling', ...
                            'down sample X', ...
                            'down sample Y', ...
                            'down sample Z', ...
                            'down sample time', ...
                            'enabled', ...
                            'frequency center', ...
                            'frequency points', ...
                            'frequency span', ...
                            'maximum frequency', ...
                            'maximum wavelength', ...
                            'min sampling per cycle', ...
                            'minimum frequency', ...
                            'minimum wavelength', ...
                            'monitor type', ...
                            'name', ...
                            'override advanced global monitor settings', ...
                            'override global monitor settings', ...
                            'record conformal mesh when possible', ...
                            'record surface conductivity', ...
                            'record_data_in_pml', ...
                            'simulation type', ...
                            'spatial interpolation', ...
                            'type', ...
                            'use linear wavelength spacing', ...
                            'use relative coordinates', ...
                            'use source limits', ...
                            'wavelength center', ...
                            'wavelength span', ...
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
                        
            obj.model_type  = 'IndexMonitor';
            
        end     % end constructor()
        

    end     % end methods
    
end






































