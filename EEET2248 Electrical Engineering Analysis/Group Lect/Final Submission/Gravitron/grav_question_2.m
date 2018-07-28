clear
clc

data = csvread('gravitron.csv');

t = data(:,1); %time
x = data(:,2); %x displacement
y = data(:,3); %y displacement
r = 7.5; %radius
m = 65; %mass
g = m*9.8; %1 g

dxdt = diff(x)./diff(t);
dydt = diff(y)./diff(t);

v = sqrt((dxdt.^2)+(dydt.^2));

a = (v.^2)/r;
f = m*a;
g_frc = f/g;

yyaxis left
plot(t(2:end,1),g_frc)
xlabel 'Time (seconds)'
ylabel 'G-Force'
ylim([0 5])
title 'G-Force vs Time vs Velocity' 


yyaxis right
plot(t(2:end,1),v)
ylabel 'Velocity (m/s)'
ylim([0 19.5473])

legend('g-force','velocity', 'Location', 'best')

