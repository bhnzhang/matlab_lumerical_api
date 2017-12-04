function y=Coupler_Optimization(x_position,theta,pitch,dc,h)

%Modify fiber position, theta, duty cycle, pitch and run the
%simulation
code=strcat('switchtolayout;',...
'select("grating_coupler_2D");',...
'set("pitch",',num2str(pitch*1e-6,16),');',...
'set("duty cycle",',num2str(dc,16),');',...
'select("fiber");',...
'set("x",',num2str(x_position*1e-5,16),');',...
'set("theta0",',num2str(theta*10,16),');',...
'run;');
appevalscript(h,code);

%Get the coupled power from T monitor to
%FDTD workspace as variable 'T_avg_FDTD'
code=strcat('T_avg_FDTD=getresult("model","T_avg");');
appevalscript(h,code);

%Get the average transmission(figure of merit) from FDTD workspace to
%Matlab workspace
T_MatlabFun=appgetvar(h,'T_avg_FDTD');
y=1-abs(T_MatlabFun);

%Uncommnet this section to display the optimized parameters and
%figure of merit for each run in FDTD
%disp(strcat('x_pos= ',num2str(x_position,10),'...theta= ',num2str(theta,10),'...pitch= ',num2str(pitch,10),'...DC= ',num2str(dc,10)));
%disp(strcat('1-abs(T)= ',num2str(y,10)));
end