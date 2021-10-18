classdef c_dipolesource < c_lumBaseObject
% Lumerical dipole source object
% unique to fdtd
% 
% author: bohan
%
% List of properties of the lumerical object
% returned when called ?set; on a modesource model object:
% amplitude
% angle
% bandwidth
% base amplitude
% center frequency
% center wavelength
% dipole type
% eliminate discontinuities
% enabled
% frequency
% frequency span
% frequency start
% frequency stop
% name
% offset
% optimize for short pulse
% override global source settings
% phase
% phi
% pulse type
% pulselength
% record local field
% set frequency
% set time domain
% set wavelength
% theta
% total amplitude
% type
% use global source settings
% use relative coordinates
% wavelength span
% wavelength start
% wavelength stop
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
        
        function obj = c_dipolesource( varargin )
            % constructor
            %
            % inputs:
            %   varargin = name value pairs
            %           where name must be one of the valid props
            
            % valid property names
            valid_props =   { ...
                            'amplitude', ...
                            'angle', ...
                            'bandwidth', ...
                            'base amplitude', ...
                            'center frequency', ...
                            'center wavelength', ...
                            'dipole type', ...
                            'eliminate discontinuities', ...
                            'enabled', ...
                            'frequency', ...
                            'frequency span', ...
                            'frequency start', ...
                            'frequency stop', ...
                            'name', ...
                            'offset', ...
                            'optimize for short pulse', ...
                            'override global source settings', ...
                            'phase', ...
                            'phi', ...
                            'pulse type', ...
                            'pulselength', ...
                            'record local field', ...
                            'set frequency', ...
                            'set time domain', ...
                            'set wavelength', ...
                            'theta', ...
                            'total amplitude', ...
                            'type', ...
                            'use global source settings', ...
                            'use relative coordinates', ...
                            'wavelength span', ...
                            'wavelength start', ...
                            'wavelength stop', ...
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
                            'z span', ...
                            };

            obj = obj@c_lumBaseObject( valid_props, varargin{:} );
                        
            obj.model_type  = 'DipoleSource';
            
        end     % end constructor()
        

    end     % end methods
    
end






































