classdef (Abstract) c_lumBaseObject
% Lumerical base object class
% 
% author: bohan
%
% some things that this class will handle
% storing properties of the object
% saving the name of the object
% setting and getting values
    
    properties
        
        props;          % struct that will store all properties
                        % properties that have names with spaces ' ' in the
                        % name will be renamed with underscores '_' in
                        % placement of ' '
        valid_props;    % cell array that stores valid property names
                        % for example { 'x min', 'x max', 'rotation' };

    end     % end properties
    
    properties (Abstract)
        
        
        model_type;     % verbose name for object, such as rect, FDTD, etc. for user's own reference
        name;           % name of object. Required for selecting the object. Needs to match what's in lumerical
        
    end
    
    
    methods
        
        function obj = c_lumBaseObject( valid_props, varargin )
            % constructor
            %
            % inputs:
            %   varargin = name value pairs
            %           where name must be one of the valid props

            obj.valid_props = valid_props;
            
            % set inputs
            for ii = 1:2:length(varargin)
                if any( strcmp( obj.valid_props, varargin{ii} ) )
                    % property is valid, set the value
                    prop_name = strrep( varargin{ii}, ' ', '_' );
                    obj.props.(prop_name) = varargin{ii+1};
                    
                    % also if the object has the "name" property, set the
                    % name automatically
                    if strcmp( varargin{ii}, 'name' )
                        obj.name = varargin{ii+1};
                    end
                else
                    % spit a warning
                    warning('Property %s is not a valid property of the object', varargin{ii});
                end
            end
            
        end     % end constructor()
        
        % realized this function should be placed in c_lumericalBase.m
%         function [ obj, prop_val ] = get_property( obj, prop_name )
%             % Queries lumerical for the value of the requested, selected
%             % lumerical object
%             %
%             % Inputs:
%             %   prop_name
%             %       type: string
%             %       desc: name of property to return from lumerical
%             %
%             % Outputs:
%             %   prop_val
%             %       type: varies
%             
%             if any( strcmp( obj.valid_props, prop_name ) )
%                     % property is valid, return the value
%                     prop_val = 
%                     prop_name = strrep( prop_name, ' ', '_' );
%                     obj.props.(prop_name) = varargin{ii+1};
%             else
%                     % spit a warning
%                     error('Property %s is not a valid property of the object', varargin{ii});
%             end
%             
%         end
        

    end     % end methods
    
end





































