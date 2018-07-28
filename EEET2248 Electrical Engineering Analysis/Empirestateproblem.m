%%
%clear
clear;
clc;
%%
%variables
h = 381; %height in metres
c = 3.11; %coin mass in grams
g = 9.8; %accelartaion due to gravity in m/s/s
cd = 19.05; %coin diameter in mm
bp = 689476; %pressure to break skin 
st = 10/1000; %time in s for the coin to stop
termv = 50; %terminal velocity in kph
termvc = termv/3.6; %terminal velocity in m/s
%%
%script
t = timeT(h,g);
fprintf('---Default Scenario---\n')
fprintf('Time Taken is: %f seconds\n', t)

vf = vFin(t,g);
fprintf('Final velocity is: %f metres per second\n', vf)
%%
cm = c/1000; %coin mass in kg
cdf = cd/1000; % coin diameter in metres
cr = cdf/2; %coin radius
ca = pi*cr*cr; %coin area

%formulas for pressure
a = vf/st; %decelaration
F = cm*a; %stopping force
P = F/ca; %pressure

fprintf('Pressure exerted is: %f Pa\n', P)
fprintf('Pressure required to break skin is: %f Pa\n\n', bp)

tv = [0:.1:t]; %time as a vector
vv = g*tv;
sv = (g/2)* (tv.^2);

figure(1)
plot(tv,vv);
title('time vs velocity');
xlabel('time (s)');
ylabel('velocity (m/s)');

figure(2)
plot(tv,sv);
title('time vs distance');
xlabel('time (s)');
ylabel('distance (m)');
%%
%terminal velocity scenario
fprintf('---Terminal Velocity Scenario---\n')

termt = termvc/g; %time taken to reach terminal v
termd = 0.5*g*(termt.^2); %displacement in above time
termh = h - termd; %height above the ground at terminal v



fprintf('Time taken to reach terminal velocity: %f\n', termt)
fprintf('Distance from ground at terminal velocity: %f\n', termh)

%formulas for pressure
a = termvc/st; %decelaration
F = cm*a; %stopping force
P = F/ca; %pressure

fprintf('Pressure exerted is: %f Pa\n', P)
fprintf('Pressure required to break skin is: %f Pa\n', bp)

%%
%Importing excel spreadsheet
[BHeights]=xlsread('Data Files\Excel\Buildings.xls', 1 ,'D1:D136');
[BFloors]=xlsread('Data Files\Excel\Buildings.xls', 1 ,'E1:E136');
[BtimeT] = timeT(BHeights, g);
[BVelFin] = vFin (BtimeT, g);

figure(3)
plot(BHeights,BVelFin)
title('building heights vs final velocity');
xlabel('height (m)');
ylabel('final velocity (m/s)');

figure(4)
scatter(BHeights, BFloors);
title('building heights vs floors');
xlabel('height (m)');
ylabel('floors');

%%
%import csv
M = csvread('Data Files\CSV\scope1.csv');

csvT = M(1:2000, 1);
csvV = M(1:2000, 2);

figure(5)
plot(csvT,csvV)
title('voltage vs time');
xlabel('time(s)');
ylabel('voltage(V)');

%%
%importing audio
[aud1] = audioread('Data Files\Audio\gameover.wav');
soundsc(aud1, 30000);
soundsc(aud1, 60000);

[aud2] = audioread('Data Files\Audio\guitar.wav');
[aud3] = audioread('Data Files\Audio\laugh.wav');

%soundsc(aud2);
%soundsc(aud3);

%%
%importing images

img1 = imread('Data Files\Images\barbara.png');
img2 = imread('Data Files\Images\lena.tiff');

figure(6)
imshow(img1)

figure(7)
imshow(img2)
%%
%functions
function c = timeT(h,g)
    c = sqrt((2*h)/g);
end

function c = vFin(t,g)
    c = g*t;
end

