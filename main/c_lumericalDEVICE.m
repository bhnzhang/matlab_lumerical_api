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
        
        
    end
    
end

