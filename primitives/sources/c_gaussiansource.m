classdef c_gaussiansource < c_lumBaseObject
% Lumerical gaussian source object
% used in FDTD and MODE
%
% see: https://kb.lumerical.com/ref_scripts_addgaussian.html
% 
% author: bohan
%
% List of properties of the lumerical object
% returned when called ?set; on a GaussianSource model object:
% NA
% additional delay
% amplitude
% angle
% angle phi
% angle theta
% bandwidth
% beam diameter
% beam parameters
% beam radius wz
% center frequency
% center wavelength
% current index
% direction
% distance from focus
% distance from waist
% divergence angle
% eliminate discontinuities
% enabled
% fill lens
% frequency
% frequency span
% frequency start
% frequency stop
% injection axis
% lens diameter
% multifrequency beam calculation
% name
% number of frequency points
% number of plane waves
% offset
% optimize for short pulse
% override global source settings
% phase
% plane wave type
% polarization angle
% pulse type
% pulselength
% set frequency
% set time domain
% set wavelength
% source shape
% type
% use global source settings
% use relative coordinates
% use scalar approximation
% use thin lens
% waist radius w0
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
        
        function obj = c_gaussiansource( varargin )
            % constructor
            %
            % inputs:
            %   varargin = name value pairs
            %           where name must be one of the valid props
            
            % valid property names
            valid_props =   { ...
                                'NA', ...
                                'additional delay', ...
                                'amplitude', ...
                                'angle', ...
                                'angle phi', ...
                                'angle theta', ...
                                'bandwidth', ...
                                'beam diameter', ...
                                'beam parameters', ...
                                'beam radius wz', ...
                                'center frequency', ...
                                'center wavelength', ...
                                'current index', ...
                                'direction', ...
                                'distance from focus', ...
                                'distance from waist', ...
                                'divergence angle', ...
                                'eliminate discontinuities', ...
                                'enabled', ...
                                'fill lens', ...
                                'frequency', ...
                                'frequency span', ...
                                'frequency start', ...
                                'frequency stop', ...
                                'injection axis', ...
                                'lens diameter', ...
                                'multifrequency beam calculation', ...
                                'name', ...
                                'number of frequency points', ...
                                'number of plane waves', ...
                                'offset', ...
                                'optimize for short pulse', ...
                                'override global source settings', ...
                                'phase', ...
                                'plane wave type', ...
                                'polarization angle', ...
                                'pulse type', ...
                                'pulselength', ...
                                'set frequency', ...
                                'set time domain', ...
                                'set wavelength', ...
                                'source shape', ...
                                'type', ...
                                'use global source settings', ...
                                'use relative coordinates', ...
                                'use scalar approximation', ...
                                'use thin lens', ...
                                'waist radius w0', ...
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
                                'z span' ...
                            };

            obj = obj@c_lumBaseObject( valid_props, varargin{:} );
                        
            obj.model_type  = 'GaussianSource';
            
        end     % end constructor()
        

    end     % end methods
    
end






































