classdef c_lumericalDEVICE < c_lumericalBase
% matlab -> lumerical DEVICE solutions API class
%
% author: bohan
%
% Inputs:
%   'notes'
%       type: string
%       desc: whatever notes the user wants to save
%   'filename'
%       type: string
%       desc: name of lsf file to open
%   'file_directory'
%       type: string
%       desc: directory of lsf file to open
    
    properties
        
    end
    
    methods
        
        
        function obj = c_lumericalDEVICE(varargin)
            % constructor
            
            % call superclass constructor
            obj = obj@c_lumericalBase( varargin{:} );

        end     % end c_lumericalDEVICE()
        
        
        function obj = appopen(obj)
            % opens DEVICE app
            obj.app_handle = appopen('device');
        end
        
        
        function obj = getdata( obj, monitor_name, result, dataset, variable_name )
            % Get raw data from simulation object
            % Typically, one would use getresult, but for some reason
            % returning data from CHARGE simulations with getresult throws
            % errors
            % 
            % see: https://kb.lumerical.com/en/ref_scripts_getdata.html
            %
            % Inputs:
            %   monitor_name
            %       type: string
            %       desc: name of monitor to return data from
            %   result
            %       type: string
            %       desc: name of result to return data from
            %   dataset
            %       type: string
            %       desc: name of result data to return
            %   variable_name
            %       type: string
            %       desc: name of lumerical variable to save to
            
            % save variable in lumerical
            obj = obj.write_command( sprintf('%s = getdata(''%s'', ''%s'', ''%s'');', variable_name, monitor_name, result, dataset ) ); 
            
            % document variable
            obj.list_of_variables{end+1} = variable_name;
            
        end     % end getdata()
        
    end
    
end

