% test index writing function

clear; close all;

% make lumerical fdtd object
obj = c_lumericalFDTD(  'notes', 'psdlkfjsdlkfj', ...
                        'filename', 'nuthin.lsf', ...
                        'file_directory', pwd );
        
% open app
obj = obj.appopen();
                    
% coordinates
x = linspace( -2, 2, 10 );
y = linspace( -3, 3, 10 );

% index
N                           = 1.5*ones( length(y), length(x) );
N( y > -2 & y < 2, : )      = 1.6;

% % export index to txt
% obj = obj.write_index_to_txt( N, x, y );
% 
% % now try loading it into lumerical
% filename            = [pwd filesep 'N.txt'];
% file_units          = 'microns';
% x0                  = 0;
% y0                  = 0;
% z0                  = 0;
% reverse_index_order = 0;
% obj                 = obj.importnk( filename, file_units, x0, y0, z0, reverse_index_order );

% end user function
units   = 'microns';
obj     = obj.import_index_to_lumerical( N, units, x, y );

% execute commands
obj = obj.execute_commands();   