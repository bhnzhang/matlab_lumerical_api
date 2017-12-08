% author: bohan
%
% test script for debuggin lumerical MODE class

clear; close all;

addpath( ['..' filesep 'main'] );

% inputs
notes       = 'hello';
filename    = 'test_file.lsf';
file_dir    = pwd;

obj = c_lumericalMODE(  'notes', notes, ...
                        'filename', filename, ...
                        'file_directory', file_dir );
                    
% open lumerical
obj = obj.appopen();
% pause(2);
                    
% test file open/close/write
% obj = obj.open_lsf_file( 'w' );             % open file
% obj = obj.close_lsf_file();                 % close file  
% obj = obj.write_to_lsf_file( '# this is a comment' );         % write text to file
% obj = obj.write_to_lsf_file( 'addrect;' );                     % write text to file
% obj = obj.write_to_lsf_file( 'set(''x min'', 1e-6);' );

% % test set property
% prop_name   = 'x';
% prop_val    = 1e-6;
% obj = obj.setprop(prop_name, prop_val);
% prop_name   = 'name';
% prop_val    = 'REKTangle';
% obj = obj.setprop(prop_name, prop_val);

% test add rectangle
obj = obj.addrect(  'name', 'timmy', ...
                    'x min', -0.5e-6, ...
                    'x max', 0.5e-6, ...
                    'y min', -0.5e-6, ...
                    'y max', 0.5e-6 );

% add FDE
obj = obj.addFDE(   'x min', -3e-6, 'x max', 3e-6, ...
                    'y min', -3e-6, 'y max', 3e-6, ...
                    'solver type', '2D Z normal', ...
                    'x min bc', 'PML', ...
                    'x max bc', 'PML', ...
                    'y min bc', 'PML', ...
                    'y max bc', 'PML' );

% find modes
obj = obj.findmodes();

% return mode 1 E field
obj = obj.getresult( 'mode1', 'E', 'Efield' );
                
% execute script
obj = obj.execute_script();

% close lumerical
obj = obj.appclose();