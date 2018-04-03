% author: bohan
%
% script for testing lumerical FDTD api

clear; close all;

% dependencies
addpath( 'C:\Users\beezy\git\matlab_lumerical_api\main' );                  % main lumerical/matlab api code, laptop

% inputs
notes       = 'hello';
filename    = 'test_file.lsf';
file_dir    = pwd;

obj = c_lumericalFDTD(  'notes', notes, ...
                        'filename', filename, ...
                        'file_directory', file_dir );
                    
% open lumerical
obj = obj.appopen();


% test add rectangle
obj = obj.addrect(  'name', 'timmy',    ...
                    'x min', -0.5e-6,   ...
                    'x max', 0.5e-6,    ...
                    'y min', -0.5e-6,   ...
                    'y max', 0.5e-6,    ...
                    'index', 3 );

% test request value from rectangle
obj = obj.getprop( 'x min', 'rect_xmin' );

% execute commands
obj = obj.execute_commands();
                
% transfer property to matlab
[obj, rect_xmin] = obj.getvar( 'rect_xmin' );
% 
% % add FDE
% obj = obj.addFDE(   'x min', -3e-6, 'x max', 3e-6,  ...
%                     'y min', -3.5e-6, 'y max', 3.5e-6,  ...
%                     'solver type', '2D Z normal',   ...
%                     'x min bc', 'PML', ...
%                     'x max bc', 'PML', ...
%                     'y min bc', 'PML', ...
%                     'y max bc', 'PML' );
% 
% % request default properties from FDE
% obj = obj.getprop( 'bent waveguide', 'fde_prop_bent_wg' );
%                 
% % find modes
% obj = obj.findmodes();
% 
% % save mode 1 E field to a lumerical variable
% obj = obj.saveresult( 'mode1', 'Ex', 'mode1_Ex' );
% obj = obj.saveresult( 'mode2', 'Ex', 'mode2_Ex' );
% obj = obj.saveresult( 'mode1', 'x', 'x' );
% obj = obj.saveresult( 'mode1', 'y', 'y' );
% 
% % % execute script
% % obj = obj.execute_script();
% 
% % execute commands
% obj = obj.execute_commands();
% 
% % transfer property to matlab
% [obj, fde_prop_bent_wg] = obj.getvar( 'fde_prop_bent_wg' );
% 
% % transfer Ex to matlab
% [obj, mode1_Ex] = obj.getvar( 'mode1_Ex' );  
% [obj, mode2_Ex] = obj.getvar( 'mode2_Ex' ); 
% [obj, x]        = obj.getvar( 'x' ); 
% [obj, y]        = obj.getvar( 'y' );
% 
% % plot modes
% figure;
% imagesc( x, y, real(mode1_Ex) );
% xlabel('x (m)'); ylabel('y (m)'); 
% colorbar;
% set( gca, 'ydir', 'normal' );
% title('mode 1');
% 
% % close lumerical
% obj = obj.appclose();