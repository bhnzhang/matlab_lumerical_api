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
pause(2);
                    
% test file open/close/write
% obj = obj.open_lsf_file( 'w' );             % open file
% obj = obj.close_lsf_file();                 % close file  
obj = obj.write_to_lsf_file( '# this is a comment' );         % write text to file
obj = obj.write_to_lsf_file( 'addrect;' );                     % write text to file
obj = obj.write_to_lsf_file( 'set(''x min'', 1e-6);' );

% execute script
obj = obj.execute_script();

% close lumerical
% obj = obj.appclose();