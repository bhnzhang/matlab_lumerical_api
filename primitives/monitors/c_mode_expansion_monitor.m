classdef c_mode_expansion_monitor < c_lumBaseObject
% Lumerical mode expansion monitor
% see:
%   https://kb.lumerical.com/en/ref_sim_obj_monitors_mode_expansion.html
%   and
%   https://kb.lumerical.com/en/ref_sim_obj_using_mode_expansion_monitors.html
% supported by FDTD
% 
% author: bohan
%
% List of properties of the lumerical object
% returned when called ?get; on a index monitor model object:
% align to frequency monitor center
% auto update
% bend location
% bend location X
% bend location Y
% bend location Z
% bend orientation
% bend radius
% bent waveguide
% custom frequency samples
% down sample X
% down sample Y
% down sample Z
% enabled
% frequency center
% frequency points
% frequency span
% maximum frequency
% maximum wavelength
% minimum frequency
% minimum wavelength
% mode selection
% monitor type
% name
% override advanced global monitor settings
% override global monitor settings
% phi
% rotation offset
% sample spacing
% selected mode numbers
% theta
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
        
        function obj = c_mode_expansion_monitor( varargin )
            % constructor
            %
            % inputs:
            %   varargin = name value pairs
            %           where name must be one of the valid props
            
            % valid property names
            valid_props =   { ...
                            'align to frequency monitor center', ...
                            'auto update', ...
                            'bend location', ...
                            'bend location X', ...
                            'bend location Y', ...
                            'bend location Z', ...
                            'bend orientation', ...
                            'bend radius', ...
                            'bent waveguide', ...
                            'custom frequency samples', ...
                            'down sample X', ...
                            'down sample Y', ...
                            'down sample Z', ...
                            'enabled', ...
                            'frequency center', ...
                            'frequency points', ...
                            'frequency span', ...
                            'maximum frequency', ...
                            'maximum wavelength', ...
                            'minimum frequency', ...
                            'minimum wavelength', ...
                            'mode selection', ...
                            'monitor type', ...
                            'name', ...
                            'override advanced global monitor settings', ...
                            'override global monitor settings', ...
                            'phi', ...
                            'rotation offset', ...
                            'sample spacing', ...
                            'selected mode numbers', ...
                            'theta', ...
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
                            'z span' };

            obj = obj@c_lumBaseObject( valid_props, varargin{:} );
                        
            obj.model_type  = 'ModeExpansionMonitor';
            
        end     % end constructor()
        

    end     % end methods
    
end






































