classdef c_FDTD < c_lumBaseObject
% Lumerical finite difference time domain solver region object
% Specific to FDTD solutions
%
% List of properties of the lumerical object
% returned when called ?set; on a FDTD model object:
% last updated for lumerical 2023 R2.0
% allow grading in x
% allow grading in y
% allow grading in z
% allow symmetry on all boundaries
% always use complex fields
% angle phi
% angle theta
% auto scale pml parameters
% auto shutoff max
% auto shutoff min
% background material
% bfast alpha
% bfast dt multiplier
% bloch units
% checkpoint at shutoff
% checkpoint during simulation
% checkpoint period
% conformal meshing refinement
% define x mesh by
% define y mesh by
% define z mesh by
% dimension
% direction
% down sample time
% dt
% dt stability factor
% dx
% dy
% dz
% enabled
% express mode
% extend structure through pml
% force symmetric x mesh
% force symmetric y mesh
% force symmetric z mesh
% global monitor custom frequency samples
% global monitor frequency center
% global monitor frequency points
% global monitor frequency span
% global monitor maximum frequency
% global monitor maximum wavelength
% global monitor minimum frequency
% global monitor minimum wavelength
% global monitor sample spacing
% global monitor use source limits
% global monitor use wavelength spacing
% global monitor wavelength center
% global monitor wavelength span
% global source bandwidth
% global source center frequency
% global source center wavelength
% global source eliminate discontinuities
% global source frequency
% global source frequency span
% global source frequency start
% global source frequency stop
% global source offset
% global source optimize for short pulse
% global source pulse type
% global source pulselength
% global source set frequency
% global source set time domain
% global source set wavelength
% global source wavelength span
% global source wavelength start
% global source wavelength stop
% grading factor
% index
% injection axis
% kx
% ky
% kz
% max source time signal length
% mesh accuracy
% mesh allowed size increase factor
% mesh cells per wavelength
% mesh cells x
% mesh cells y
% mesh cells z
% mesh distance between fixed points
% mesh frequency max
% mesh frequency min
% mesh merge distance
% mesh minimum neighbor size
% mesh refinement
% mesh size reduction factor
% mesh step for metals
% mesh type
% mesh wavelength max
% mesh wavelength min
% meshing refinement
% meshing tolerance
% min mesh step
% name
% nx
% ny
% nz
% override simulation bandwidth for mesh generation
% param1
% param2
% pml alpha
% pml alpha polynomial
% pml kappa
% pml layers
% pml max layers
% pml min layers
% pml polynomial
% pml profile
% pml sigma
% pml type
% same settings on all boundaries
% set based on source angle
% set process grid
% set simulation bandwidth
% simulation frequency max
% simulation frequency min
% simulation temperature
% simulation time
% simulation wavelength max
% simulation wavelength min
% snap pec to yee cell boundary
% source index
% type
% use auto shutoff
% use bfast fdtd
% use divergence checking
% use early shutoff
% use legacy conformal interface detection
% use mesh step for metals
% use relative coordinates
% x
% x max
% x max bc
% x min
% x min bc
% x span
% y
% y max
% y max bc
% y min
% y min bc
% y span
% z
% z max
% z max bc
% z min
% z min bc
% z span
    
    properties
        
        model_type;
        name;          

    end     % end properties
    
    
    methods
        
        function obj = c_FDTD( varargin )
            % constructor
            %
            % inputs:
            %   varargin = name value pairs
            %           where name must be one of the valid props
            
            % valid property names
            valid_props =   { ...
                            'allow grading in x', ...
                            'allow grading in y', ...
                            'allow grading in z', ...
                            'allow symmetry on all boundaries', ...
                            'always use complex fields', ...
                            'angle phi', ...
                            'angle theta', ...
                            'auto scale pml parameters', ...
                            'auto shutoff max', ...
                            'auto shutoff min', ...
                            'background material', ...
                            'bfast alpha', ...
                            'bfast dt multiplier', ...
                            'bloch units', ...
                            'checkpoint at shutoff', ...
                            'checkpoint during simulation', ...
                            'checkpoint period', ...
                            'conformal meshing refinement', ...
                            'define x mesh by', ...
                            'define y mesh by', ...
                            'define z mesh by', ...
                            'dimension', ...
                            'direction', ...
                            'down sample time', ...
                            'dt', ...
                            'dt stability factor', ...
                            'dx', ...
                            'dy', ...
                            'dz', ...
                            'enabled', ...
                            'express mode', ...
                            'extend structure through pml', ...
                            'force symmetric x mesh', ...
                            'force symmetric y mesh', ...
                            'force symmetric z mesh', ...
                            'global monitor custom frequency samples', ...
                            'global monitor frequency center', ...
                            'global monitor frequency points', ...
                            'global monitor frequency span', ...
                            'global monitor maximum frequency', ...
                            'global monitor maximum wavelength', ...
                            'global monitor minimum frequency', ...
                            'global monitor minimum wavelength', ...
                            'global monitor sample spacing', ...
                            'global monitor use source limits', ...
                            'global monitor use wavelength spacing', ...
                            'global monitor wavelength center', ...
                            'global monitor wavelength span', ...
                            'global source bandwidth', ...
                            'global source center frequency', ...
                            'global source center wavelength', ...
                            'global source eliminate discontinuities', ...
                            'global source frequency', ...
                            'global source frequency span', ...
                            'global source frequency start', ...
                            'global source frequency stop', ...
                            'global source offset', ...
                            'global source optimize for short pulse', ...
                            'global source pulse type', ...
                            'global source pulselength', ...
                            'global source set frequency', ...
                            'global source set time domain', ...
                            'global source set wavelength', ...
                            'global source wavelength span', ...
                            'global source wavelength start', ...
                            'global source wavelength stop', ...
                            'grading factor', ...
                            'index', ...
                            'injection axis', ...
                            'kx', ...
                            'ky', ...
                            'kz', ...
                            'max source time signal length', ...
                            'mesh accuracy', ...
                            'mesh allowed size increase factor', ...
                            'mesh cells per wavelength', ...
                            'mesh cells x', ...
                            'mesh cells y', ...
                            'mesh cells z', ...
                            'mesh distance between fixed points', ...
                            'mesh frequency max', ...
                            'mesh frequency min', ...
                            'mesh merge distance', ...
                            'mesh minimum neighbor size', ...
                            'mesh refinement', ...
                            'mesh size reduction factor', ...
                            'mesh step for metals', ...
                            'mesh type', ...
                            'mesh wavelength max', ...
                            'mesh wavelength min', ...
                            'meshing refinement', ...
                            'meshing tolerance', ...
                            'min mesh step', ...
                            'name', ...
                            'nx', ...
                            'ny', ...'
                            'nz', ...
                            'override simulation bandwidth for mesh generation', ...
                            'param1', ...
                            'param2', ...
                            'pml alpha', ...
                            'pml alpha polynomial', ...
                            'pml kappa', ...
                            'pml layers', ...
                            'pml max layers', ...
                            'pml min layers', ...
                            'pml polynomial', ...
                            'pml profile', ...
                            'pml sigma', ...
                            'pml type', ...
                            'same settings on all boundaries', ...
                            'set based on source angle', ...
                            'set process grid', ...
                            'set simulation bandwidth', ...
                            'simulation frequency max', ...
                            'simulation frequency min', ...
                            'simulation temperature', ...
                            'simulation time', ...
                            'simulation wavelength max', ...
                            'simulation wavelength min', ...
                            'snap pec to yee cell boundary', ...
                            'source index', ...
                            'type', ...
                            'use auto shutoff', ...
                            'use bfast fdtd', ...
                            'use divergence checking', ...
                            'use early shutoff', ...
                            'use legacy conformal interface detection', ...
                            'use mesh step for metals', ...
                            'use relative coordinates', ...
                            'x', ...
                            'x max', ...
                            'x max bc', ...
                            'x min', ...
                            'x min bc', ...
                            'x span', ...
                            'y', ...
                            'y max', ...
                            'y max bc', ...
                            'y min', ...
                            'y min bc', ...
                            'y span', ...
                            'z', ...
                            'z max', ...
                            'z max bc', ...
                            'z min', ...
                            'z min bc', ...
                            'z span', ...
                            };
            
            obj = obj@c_lumBaseObject( valid_props, varargin{:} );
                        
            obj.model_type  = 'FiniteDifferenceTimeDomainSolver';
            obj.name        = 'FDTD';
            
        end     % end constructor()
        

    end     % end methods
    
end






































