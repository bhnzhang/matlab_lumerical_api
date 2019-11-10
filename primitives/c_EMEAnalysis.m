classdef c_EMEAnalysis < c_lumBaseObject
% Lumerical EME Analysis object
% 
% author: bohan
%
% List of properties of the lumerical object
% returned when called ?set; on an EME analysis object:
% group spans
% override periodicity
% periods
% port
% mode
% source port
% source mode
% propagation sweep
% calculate result for all output modes
% parameter
% start
% stop
% interval
% number of points
% subcell method
% energy conservation
% tolerance 1
% tolerance 2
% tolerance 3
% fractional offset for group delay
% include fast diagnostics
% include slow diagnostics
% update monitors
% override max modes
% max modes
% mode convergence sweep
% start mode
% mode interval
% override wavelength
% wavelength
% wavelength sweep
% start wavelength
% stop wavelength
% number of wavelength points
% calculate group delays
    
    properties
        
        model_type;
        name; 

    end     % end properties
    
    
    methods
        
        function obj = c_EMEAnalysis( varargin )
            % constructor
            %
            % inputs:
            %   varargin = name value pairs
            %           where name must be one of the valid props
            
            % valid property names
            valid_props =   {
                            'group spans', ...
                            'override periodicity', ...
                            'periods', ...
                            'port', ...
                            'mode', ...
                            'source port', ...
                            'source mode', ...
                            'propagation sweep', ...
                            'calculate result for all output modes', ...
                            'parameter', ...
                            'start', ...
                            'stop', ...
                            'interval', ...
                            'number of points', ...
                            'subcell method', ...
                            'energy conservation', ...
                            'tolerance 1', ...
                            'tolerance 2', ...
                            'tolerance 3', ...
                            'fractional offset for group delay', ...
                            'include fast diagnostics', ...
                            'include slow diagnostics', ...
                            'update monitors', ...
                            'override max modes', ...
                            'max modes', ...
                            'mode convergence sweep', ...
                            'start mode', ...
                            'mode interval', ...
                            'override wavelength', ...
                            'wavelength', ...
                            'wavelength sweep', ...
                            'start wavelength', ...
                            'stop wavelength', ...
                            'number of wavelength points', ...
                            'calculate group delays' ...
                            };
            
            obj = obj@c_lumBaseObject( valid_props, varargin{:} );
                        
            obj.model_type = 'EMEAnalysis';
            
        end     % end constructor()
        

    end     % end methods
    
end





































