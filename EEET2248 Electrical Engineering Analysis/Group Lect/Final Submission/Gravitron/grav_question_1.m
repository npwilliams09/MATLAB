clear
clc

m = 65; %mass(kg)
r = 7.5; %radius(m)
rps = 24/60; %revolutions per second
w = 2*pi*rps; %angular speed(rads/sec)
v = w*r; %tangential velocity(m/s)
f = m*(v^2/r); %Force (N)
g = m*9.8; %one g-force
g_force = f/g; %total g-force

fprintf('The force experienced by the riders is %1.2f Newtons, and the g-force is %1.2f', f, g_force)