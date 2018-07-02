% testing project load and save

clear; close all;


% project to load
filename = 'C:\Users\bz\Google Drive\research\popovic group\proposals\2018 supercables\device sims\moscap transient response\moscap_transient_response.ldev';

% new device api object
device_obj = c_lumericalDEVICE( 'notes', 'blah', 'filename', 'test_device_projectload.lsf', 'file_directory', pwd );

% open app
device_obj = device_obj.appopen();

% load project
device_obj = device_obj.load_project( filename );
device_obj = device_obj.execute_commands();

% save project
device_obj = device_obj.save_project( 'hurhrhur.ldev' );