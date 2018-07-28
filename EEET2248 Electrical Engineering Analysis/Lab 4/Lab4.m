%% Lab 4
%initialise
clc;
clear;

%% variables
step = 10;
soundS = 331.2;
gForce = 9.8;
gTarget = 9*gForce - gForce;
%% functions
mach = @(speed) (speed/soundS);
%% Import
%import data sheet
data = xlsread("data.xlsx");
time = data(:,1);
alt = data(:,2);
altP = alt/1000;

figure('position', [250, 70, 1000, 700])
subplot(3,1,1)
plot(time,altP)
title('Altitude vs Time')
xlabel('Time (secs)')
ylabel('Altitude (km)')

y = diff(alt)/diff(time);
vel = y(:,1);
t2 = 5 + time(1):step:time(end);
t2 = reshape(t2,[25,1]);

subplot(3,1,2)
plot(t2, vel)
title('Velocity vs Time')
xlabel('Time (secs)')
ylabel('Velocity(m/s)')


y2 = diff(vel)/diff(t2);
acc = y2(:,1);
t3 = 5 + t2(1):step:t2(end);
t3 = reshape(t3,[24,1]);

subplot(3,1,3)
plot(t3,acc)
hold on
plot(t3,gTarget*ones(size(t3)))
text(50,100,'\downarrow G Force Target')
title('Acceleration vs Time')
xlabel('Time (secs)')
ylabel('Acceleration(m/s/s)')

maxS = max(vel);
maxST = find(vel == maxS)*10;
maxA = max(acc);
maxAT = find(acc == maxA)*10;

%interp arrays
velX = 5:10:245;
velXI = 5:0.1:245;
t2 = 5:0.1:245;
vel = interp1(velX, vel, velXI, 'linear');

accX = 10:10:240;
accXI = 10:0.1:240;
t3 = 10:0.1:240;
acc = interp1(accX, acc, accXI, 'linear');



machArray = zeros(1,floor(mach(maxS)));
machC = 1;
for i = 1:1:length(vel)
    if (mach(vel(i)) >= machC)
        machArray(machC) =  t2(i);
        machC = machC + 1;
    end
end

fprintf('Max speed %g m/s is reached at %g seconds\n',maxS,maxST);
fprintf('Max acceleration %g m/s/s is reached at %g seconds\n\n',maxA,maxAT);

for i = 1:1:floor(mach(maxS))
    fprintf('Mach %g is reached at %g seconds\n',i,machArray(i));
end


gArray = [];

for i = 1:1:length(acc)
    if acc(i) > gTarget
        gArray = [gArray,t3(i)];
    end
end

startG = gArray(1);
endG = gArray(end);

fprintf("\nG-force is greater than 9 gs between %g and %g seconds\n",startG,endG);

figure(4)
plot(t2,floor(mach(vel)))
grid on
xlim([5 245])
title('Mach Speeds vs Time')
xlabel('Time (s)')
ylabel('mach')
