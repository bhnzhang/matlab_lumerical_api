classdef c_tfsf < c_lumBaseObject
% Lumerical TFSF source
% 
% author: bohan
%
% List of properties of the lumerical object
% returned when called ?get; on a tfsf object:
% amplitude
% angle phi
% angle theta
% bandwidth
% center frequency
% center wavelength
% direction
% eliminate discontinuities
% enabled
% frequency
% frequency span
% frequency start
% frequency stop
% injection axis
% name
% offset
% optimize for short pulse
% override global source settings
% phase
% polarization angle
% pulse type
% pulselength
% set frequency
% set time domain
% set wavelength
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
        
        function obj = c_tfsf( varargin )
            % constructor
            %
            % inputs:
            %   varargin = name value pairs
            %           where name must be one of the valid props
            
            % valid property names
            valid_props =   { ...
                            'amplitude', ...
                            'angle phi', ...
                            'angle theta', ...
                            'bandwidth', ...
                            'center frequency', ...
                            'center wavelength', ...
                            'direction', ...
                            'eliminate discontinuities', ...
                            'enabled', ...
                            'frequency', ...
                            'frequency span', ...
                            'frequency start', ...
                            'frequency stop', ...
                            'injection axis', ...
                            'name', ...
                            'offset', ...
                            'optimize for short pulse', ...
                            'override global source settings', ...
                            'phase', ...
                            'polarization angle', ...
                            'pulse type', ...
                            'pulselength', ...
                            'set frequency', ...
                            'set time domain', ...
                            'set wavelength', ...
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
                            'z span' ...
                            };

            obj = obj@c_lumBaseObject( valid_props, varargin{:} );
                        
            obj.model_type  = 'TFSFSource';
            
        end     % end constructor()
        

    end     % end methods
    
end






































