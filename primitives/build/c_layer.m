classdef c_layer < c_lumBaseObject
% Lumerical layer object for layer builder
%
% List of properties
% enabled
% name
% layer number
% start position
% thickness
% pattern material
% background material
% process
% sidewall angle
% pattern growth delta
    
    properties
        
        model_type;
        name; 

    end     % end properties
    
    
    methods
        
        function obj = c_layer( varargin )
            % constructor
            %
            % inputs:
            %   varargin = name value pairs
            %           where name must be one of the valid props
            
            % valid property names
            valid_props =   {
                            'enabled';
                            'name';
                            'layer number';
                            'start position';
                            'thickness';
                            'pattern material';
                            'background material';
                            'process';
                            'sidewall angle';
                            'pattern growth delta';
                            };
            
            obj = obj@c_lumBaseObject( valid_props, varargin{:} );
                        
            obj.model_type = 'layer';
            
        end     % end constructor()
        

    end     % end methods
    
end





































