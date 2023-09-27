classdef c_field_and_power_monitor < c_lumBaseObject
% Lumerical Frequency domain field and power monitor
% see: https://kb.lumerical.com/en/ref_sim_obj_monitors_frequency_domain_field.html
% supported by FDTD and MODE
%
% last updated for lumerical 2022 R2.1
% 
% author: bohan
%
% List of properties of the lumerical object
% returned when called ?get; on a index monitor model object:
% Nyquist limit
% actual sampling
% apodization
% apodization center
% apodization freq width
% apodization time width
% custom frequency samples
% delta
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
% override advanced global monitor settings
% override global monitor settings
% partial spectral average
% record data in pml
% sample spacing
% simulation type
% spatial interpolation
% standard fourier transform
% total spectral average
% type
% use relative coordinates
% use source limits
% use wavelength spacing
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
        
        function obj = c_field_and_power_monitor( varargin )
            % constructor
            %
            % inputs:
            %   varargin = name value pairs
            %           where name must be one of the valid props
            
            % valid property names
            valid_props =   { ...
                            'Nyquist limit', ...
                            'actual sampling', ...
                            'apodization', ...
                            'apodization center', ...
                            'apodization freq width', ...
                            'apodization time width', ...
                            'custom frequency samples', ...
                            'delta', ...
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
                            'override advanced global monitor settings', ...
                            'override global monitor settings', ...
                            'partial spectral average', ...
                            'record data in pml', ...
                            'sample spacing', ...
                            'simulation type', ...
                            'spatial interpolation', ...
                            'standard fourier transform', ...
                            'total spectral average', ...
                            'type', ...
                            'use relative coordinates', ...
                            'use source limits', ...
                            'use wavelength spacing', ...
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
                            'z span', ...
                            };

            obj = obj@c_lumBaseObject( valid_props, varargin{:} );
                        
            obj.model_type  = 'DFTMonitor_field_and_power';
            
        end     % end constructor()
        

    end     % end methods
    
end






































