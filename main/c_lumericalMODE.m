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
        
        
        function obj = addFDE(obj, varargin)
            % adds a FDE (finite difference eigenmode) solver to the
            % lumerical model
            %
            % Inputs:
            %   varargin
            %       Name-value pairs of form 'property name', property value
            %       See the primitives/c_rect.m class for valid properties
            %
            % Example:
            %   obj = obj.addFDE( 'name', 'timmy', 'x', 1e-6 );
            %       Draws a rectangle in lumerical, set it's name to 'timmy' and
            %       it's x position to 1e-6
            %       The equivalent lumerical commands are:
            %           addrect;
            %           set('name','timmy');
            %           set('x', 1e-6);  
            
        end     % end addFDE()

        
    end     % end methods
    
    
end

