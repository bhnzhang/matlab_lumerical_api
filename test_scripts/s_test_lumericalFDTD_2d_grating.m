% author: bohan
%
% script for testing lumerical FDTD api
% 2D grating example

clear; close all;

% dependencies
addpath( genpath( '..' ) );


% wavelength
lambda0     = 1.55e-6;                                                      % units m
k0          = 2*pi/lambda0;

% waveguide dimensions/materials
n_wg        = 3.5;
n_clad      = 1;
wg_thick    = 0.2e-6;

% grating dimensions
neff            = 2.5;                                                      % approx neff = 2.5
output_angle    = 15 * (pi/180);
% period          = lambda0/( neff - n_clad * sin(output_angle) );
period          = 700e-9;      
duty_cycle      = 0.8;
tooth_width     = period * duty_cycle;
etch_depth      = 0.1e-6;
n_periods       = 20;

% inputs
notes       = 'testing lumerical fdtd using a 2D grating coupler';
filename    = 'test_fdtd_2D_grating.lsf';
file_dir    = pwd;

obj = c_lumericalFDTD(  'notes', notes, ...
                        'filename', filename, ...
                        'file_directory', file_dir );
                    
% open lumerical
obj = obj.appopen();

% draw waveguide
grating_start_pos   = 0.5e-6;
waveguide_length    = grating_start_pos + n_periods * period;
obj                 = obj.addrect( 'name', 'waveguide', ...
                                   'x min', 0, ...
                                   'x max', waveguide_length, ...
                                   'y', 0, ...
                                   'y span', wg_thick, ...
                                   'override mesh order from material database', true, ...
                                   'index', n_wg, ...
                                   'mesh order', 10 );
                
% draw grating
for ii = 1:n_periods
   
    % draw in air at the end of the period
    obj = obj.addrect( 'name', [ 'tooth_' num2str(ii) ], ...
                       'x min', grating_start_pos + ii * period - (period - tooth_width), ...
                       'x max', grating_start_pos + ii * period, ...
                       'y max', wg_thick/2, ...
                       'y min', wg_thick/2 - etch_depth, ...
                       'index', n_clad, ...
                       'override mesh order from material database', true, ...
                       'mesh order', 2 );
    
end

% make sim domain
sim_domain_left     = 0;
sim_domain_right    = waveguide_length + 1e-6;
sim_domain_top      = 2e-6;
sim_domain_bot      = -2e-6;
dx                  = 10e-9;
dy                  = 10e-9;
obj = obj.addfdtd(  'x min', sim_domain_left, ...
                    'x max', sim_domain_right, ...
                    'y min', sim_domain_bot, ...
                    'y max', sim_domain_top, ...
                    'dimension', '2D', ...
                    'background index', n_clad, ...
                    'mesh type', 'uniform', ...
                    'define x mesh by', 'maximum mesh step', ...
                    'define y mesh by', 'maximum mesh step', ...
                    'dx', dx, ...
                    'dy', dy );

% add source
source_pos_x    = 0.25e-6;
obj             = obj.addmode( 'name', 'wg_mode_source', ...
                               'injection axis', 'x-axis', ...
                               'direction', 'Forward', ...
                               'mode selection', 'fundamental mode', ...
                               'x', source_pos_x, ...
                               'y', 0, ...
                               'y span', sim_domain_top - sim_domain_bot, ...
                               'center wavelength', lambda0, ...
                               'wavelength span', 100e-9 );
                           
% add refractive index monitor
obj = obj.addindex( 'name', 'index_monitor1', ...
                    'x min', sim_domain_left, ...
                    'x max', sim_domain_right, ...
                    'y min', sim_domain_bot, ...
                    'y max', sim_domain_top );

                
% % set global monitor by running a custom command
% obj = obj.write_command( 'setglobalmonitor("frequency points",100);' );
                
% get index preview
obj = obj.getresult( 'index_monitor1', 'index preview', 'index_prev_var' );
obj = obj.getattribute( 'index_prev_var', 'index_x', 'index_profile' );
obj = obj.getparameter( 'index_prev_var', 'x', 'x_coords' );
obj = obj.getparameter( 'index_prev_var', 'y', 'y_coords' );

% execute commands
obj = obj.execute_commands();             
                
% transfer property to matlab
[ obj, index_preview ]  = obj.getvar( 'index_profile' );
[ obj, x ]              = obj.getvar( 'x_coords' );
[ obj, y ]              = obj.getvar( 'y_coords' );

% plot index
figure;
imagesc( x, y, real(index_preview).' );
set(gca, 'ydir', 'normal');
title('index preview');

% add DFT field and power monitor across entire domain
obj = obj.addpower( 'name', 'field_power_monitor1', ...
                    'simulation type', '2D Z-normal', ...
                    'monitor type', '2D Z-normal', ...
                    'x min', sim_domain_left, ...
                    'x max', sim_domain_right, ...
                    'y min', sim_domain_bot, ...
                    'y max', sim_domain_top, ...
                    'override global monitor settings', true, ...
                    'use source limits', true, ...
                    'frequency points', 20, ...
                    'output Px', true, ...
                    'output Py', true );

% add DFT for transmission through upper region
obj = obj.addpower( 'name', 'monitor_up', ...
                    'simulation type', '2D Z-normal', ...
                    'monitor type', 'Linear X', ...
                    'x min', sim_domain_left, ...
                    'x max', sim_domain_right, ...
                    'y', sim_domain_top - 2*dy, ...
                    'override global monitor settings', true, ...
                    'use source limits', true, ...
                    'frequency points', 20 ); 
                
% save the project
obj = obj.save('test_fdtd_2D_grating');
                
% add run simulation command
obj = obj.run();
                
% execute commands
obj = obj.execute_commands();


% get results from dft monitor
% obj = obj.getresult( 'field_power_monitor1', 'Ez', 'Ez' );
% obj = obj.getresult( 'field_power_monitor1', 'Px', 'Px' );
% obj = obj.getresult( 'field_power_monitor1', 'Py', 'Py' );
obj = obj.getresult( 'field_power_monitor1', 'x', 'x' );
obj = obj.getresult( 'field_power_monitor1', 'y', 'y' );
obj = obj.getresult( 'field_power_monitor1', 'f', 'f' );
% obj = obj.getresult( 'monitor_up'
obj = obj.execute_commands();
% [ obj, Ez ]     = obj.getvar( 'Ez' );
% [ obj, Px ]     = obj.getvar( 'Px' );
% [ obj, Py ]     = obj.getvar( 'Py' );
[ obj, x ]      = obj.getvar( 'x' );
[ obj, y ]      = obj.getvar( 'y' );
[ obj, freq ]   = obj.getvar( 'f' );


% % grab field/power at center wavelength
% Ez_center_freq = Ez( :, :, :, round(end/2) );
% Px_center_freq = Px( :, :, :, round(end/2) );
% Py_center_freq = Py( :, :, :, round(end/2) );

% % plot field, real, center wavelength
% figure;
% imagesc( x, y, real(Ez_center_freq).' );
% xlabel('x'); ylabel('y');
% axis image; colorbar;
% title('E_z center frequency');
% 
% % plot power, x component, center wavelength
% figure;
% imagesc( x, y, real(Px_center_freq.') );
% xlabel('x'); ylabel('y');
% axis image; colorbar;
% title('P_x (real) center frequency');
% 
% % plot power, x component, center wavelength, log scale
% figure;
% imagesc( x, y, 10*log10( real(Px_center_freq.') + abs(min(real(Px_center_freq(:)))) ) );
% xlabel('x'); ylabel('y');
% axis image; colorbar;
% title('P_x (real, dB) center frequency');
% 
% % plot power, y component, center wavelength
% figure;
% imagesc( x, y, real(Py_center_freq.') );
% xlabel('x'); ylabel('y');
% axis image; colorbar;
% title('P_y (real) center frequency');

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