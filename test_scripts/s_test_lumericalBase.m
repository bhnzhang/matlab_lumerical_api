% author: bohan
%
% test script for debuggin lumerical base class

clear; close all;

% inputs
notes       = 'hello';
filename    = 'test_file.lsf';
file_dir    = pwd;

obj = c_lumericalBase(  'notes', notes, ...
                        'filename', filename, ...
                        'file_directory', file_dir );
                    
                    
% test file open/close/write
% obj = obj.open_lsf_file( 'w' );             % open file
% obj = obj.close_lsf_file();                 % close file  
obj = obj.write_to_lsf_file( 'yo momma' );  % write text to file