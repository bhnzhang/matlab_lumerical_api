classdef c_layerbuilder < c_lumBaseObject
% Lumerical layer builder object
%
% List of properties
% base mesh order
% electrical material revision
% enabled
% gds cell
% gds center x
% gds center y
% gds position reference
% gds sidewall angle position reference
% geometry
% name
% optical material revision
% process name
% process revision
% suppress sidewall angles
% thermal material revision
% type
% x
% x span
% y
% y span
% z
    
    properties
        
        model_type;
        name; 

    end     % end properties
    
    
    methods
        
        function obj = c_layerbuilder( varargin )
            % constructor
            %
            % inputs:
            %   varargin = name value pairs
            %           where name must be one of the valid props
            
            % valid property names
            valid_props =   {
                            'base mesh order';
                            'electrical material revision';
                            'enabled';
                            'gds cell';
                            'gds center x';
                            'gds center y';
                            'gds position reference';
                            'gds sidewall angle position reference';
                            'geometry';
                            'name';
                            'optical material revision';
                            'process name';
                            'process revision';
                            'suppress sidewall angles';
                            'thermal material revision';
                            'type';
                            'x';
                            'x span';
                            'y';
                            'y span';
                            'z';
                            };
            
            obj = obj@c_lumBaseObject( valid_props, varargin{:} );
                        
            obj.model_type = 'LayerBuilder';
            
        end     % end constructor()
        

    end     % end methods
    
end





































