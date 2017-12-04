function [c, ceq] = confun(x)

% Nonlinear inequality constraints x(x_pos,theta,pitch,dc)
global gap
c = tan(x(2)*pi/180)*gap-x(1)*1e-5;

% Nonlinear equality constraints
ceq = [];