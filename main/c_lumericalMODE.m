classdef c_lumericalMODE < c_lumericalBase
% matlab -> lumerical MODE solutions API class
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
        
    end     % end properties
    
    
    methods
        
        
        function obj = c_lumericalMODE( varargin )
            % constructor
            
            % call superclass constructor
            obj = obj@c_lumericalBase( varargin{:} );

        end     % end c_lumericalMODE()
        

        function obj = appopen(obj)
            % opens MODE app
            obj.app_handle = appopen('mode');
        end

        
    end     % end methods
    
    
end

