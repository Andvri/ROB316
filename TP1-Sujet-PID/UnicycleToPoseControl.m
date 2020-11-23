function [ u ] = UnicycleToPoseControl( xTrue,xGoal )
%Computes a control to reach a pose for unicycle
%   xTrue is the robot current pose : [ x y theta ]'
%   xGoal is the goal point
%   u is the control : [v omega]'

% TODO
alpha_max = 1.2;
rho_max = 0.05;

k_rho = 20;
k_alpha = 10; 
k_betha = 30;

rho = sqrt((xGoal(1)-xTrue(1))^2+(xGoal(2)-xTrue(2))^2);
alpha = AngleWrap(atan2(xGoal(2)-xTrue(2),xGoal(1)-xTrue(1)) - xTrue(3));

v = k_rho * rho;
w = k_alpha * alpha;

if(abs(alpha) > alpha_max)
  v = 0;
end
  
if (rho < rho_max)
  b = xGoal(3)-xTrue(3);
  w = k_betha*b;
end
  
u(1) = v;
u(2) = w;
 
end;
