clc;
s = sqrt(0.1);
m = 0;

% Engine
p = 0.5*(1-1/sqrt(1+(s/m)^2));
if m<0
    p = 1-p;
end
q = s/(2*sqrt(p*(1-p)));
% generate 1e6 random numbers
x=q*(2*(rand(1,10)>=p)-1);

% Check
mean(x)
std(x)
x
y=2*(rand(1,10)-0.5)