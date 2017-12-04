% Example usage of matlab-lumerical API
%
% minor edits and comments from bohan
%
% Taken from the lumerical documentation database:
% https://kb.lumerical.com/en/pic_passive_matlab-driven-optimization.html#matlabapisetupandworkflow

clear; close all;

% Add Lumerical Matlab API path
path(path,'C:\Program Files\Lumerical\FDTD\api\matlab');

% Open FDTD session
h = appopen('fdtd');    % returns a handle to the open program

% Load the FDTD simulation file and get simulation parameters
code = strcat( ['cd("' pwd '");'],...
    'load("grating_coupler_2D_Matlab_Optimization.fsp");',...
    'select("grating_coupler_2D");',...
    'coupler_y_pos=get("y");',...
    'coupler_thickness=get("h total");',...
    'select("fiber::source");',...
    'source_y_pos=get("y");',...
    'select("fiber");',...
    'fiber_y_pos=get("y");',...
    'gap=abs(fiber_y_pos+source_y_pos-coupler_y_pos-coupler_thickness);',...
    'select("FDTD");',...
    'FDTD_span=get("x span");');

% send the script in 'code' to Lumerical FDTD Solutions
appevalscript(h,code);

% Get variables 'FDTD_span' and 'gap' from FDTD workspace to Matlab
% workspace
global gap
gap         = appgetvar(h,'gap');
FDTD_span   = appgetvar(h,'FDTD_span');


% Function to be optimized x(x_position,theta,pitch,dc)
f = @(x,y)Coupler_Optimization(x(1),x(2),x(3),x(4),h);

% Optimization starting points, constraints and boundaries 
% The format is [x_position in um/10, theta in degrees/10, pitch in  um, duty cycle]
x0  = [0.5,1.7,0.75,0.75];
A   = [];
b   = [];
Aeq = [];
beq = [];
lb  = [0,1.1,0.5,0.5];
ub  = [FDTD_span/2e-5,2,0.8,0.8];
nonlcon = @confun;

% Optimization settings
options = optimoptions('fmincon');
options = optimoptions(options,'FiniteDifferenceStepSize',1e-3);
options = optimoptions(options,'Algorithm','sqp');  %alt: interior-point
options = optimoptions(options,'MaxIter', 100);
options = optimoptions(options,'PlotFcns', { @optimplotfval });
options = optimoptions(options,'Display','iter-detailed');
options = optimoptions(options,'StepTolerance',1e-3);

%Run optimization
[x,fval] = fmincon(f,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
T_avg = 1-fval;

%Display optimization results
disp(strcat({'Optimized x position: '},num2str(x(1)*10),{' um'}));
disp(strcat({'Optimized angle theta: '},num2str(x(2)*10),{' degrees'}));
disp(strcat({'Optimized pitch: '},num2str(x(3)),{' um'}));
disp(strcat({'Optimized Duty cycle: '},num2str(x(4))));
disp(strcat({'Optimized T_avg: '},num2str(T_avg)));

%Close session
appclose(h);