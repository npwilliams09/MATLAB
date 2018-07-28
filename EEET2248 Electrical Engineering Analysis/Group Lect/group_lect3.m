%%image resize Script
clc;
clear;

%% Interpolation
%import
lighthouse = im2double(imread('lighthouse.png'));
lighthouse_half = im2double(imread('lighthouse_half.png'));
lighthouse_qtr = im2double(imread('lighthouse_quarter.png'));

lena = im2double(imread('lena.tif'));
lena_half = im2double(imread('lena_half.tif'));
lena_qtr = im2double(imread('lena_quarter.tif'));


%interp lighthouse
lighthouse_half_linear = MyInterp(lighthouse_half,lighthouse,'linear');
lighthouse_qtr_linear = MyInterp(lighthouse_qtr,lighthouse,'linear');
lighthouse_half_cubic = MyInterp(lighthouse_half,lighthouse,'spline');
lighthouse_qtr_cubic = MyInterp(lighthouse_qtr,lighthouse,'spline');
lighthouse_half_nearest = MyInterp(lighthouse_half,lighthouse,'nearest');
lighthouse_qtr_nearest = MyInterp(lighthouse_qtr,lighthouse,'nearest');

%interp lena
for i = 1:3 
   lena_half_linear(:,:,i) = MyInterp(lena_half(:,:,i),lena(:,:,i),'linear');
   lena_qtr_linear(:,:,i) = MyInterp(lena_qtr(:,:,i),lena(:,:,i),'linear');
   lena_half_cubic(:,:,i) = MyInterp(lena_half(:,:,i),lena(:,:,i),'spline');
   lena_qtr_cubic(:,:,i) = MyInterp(lena_qtr(:,:,i),lena(:,:,i),'spline');
   lena_half_nearest(:,:,i) = MyInterp(lena_half(:,:,i),lena(:,:,i),'nearest');
   lena_qtr_nearest(:,:,i) = MyInterp(lena_qtr(:,:,i),lena(:,:,i),'nearest');
end

% figure(1)
% imshow(lighthouse_half_nearest)
% 
% figure(2)
% imshow(lighthouse_qtr_linear)
% 
% figure(3)
% imshow(lena_half_cubic)

%% Mean Squared Error Lena

% Lena Half
orig = (lena);
new = (lena_half_cubic);
msehalf_cube = mse(orig,new,'clr');
fprintf ('Mean Squared error for Lena half-sized:\n\nThe mean squared error for the cubic-spline interpolation of the lena half-size image is %f', msehalf_cube)

new = (lena_half_linear);
msehalf_lin = mse(orig,new,'clr');
fprintf ('\n \nThe mean squared error for the linear interpolation of the lena half-size image is %f', msehalf_lin)

new = (lena_half_nearest);
msehalf_near = mse(orig,new,'clr');
fprintf ('\n \nThe mean squared error for the nearest-neighbor interpolation of the lena half-size image is %f', msehalf_near)

%Lena Quarter
new = (lena_qtr_cubic);
mseqtr_cube = mse(orig,new,'clr');
fprintf ('\n\n\nMean Squared error for Lena quarter-sized:\n\nThe mean squared error for the cubic-spline interpolation of the lena quarter-size image is %f', mseqtr_cube)

new = (lena_qtr_linear);
mseqtr_lin = mse(orig,new,'clr');
fprintf ('\n \nThe mean squared error for the linear interpolation of the lena quarter-size image is %f', mseqtr_lin)

new = (lena_qtr_nearest);
mseqtr_near = mse(orig,new,'clr');
fprintf ('\n \nThe mean squared error for the nearest-neighbor interpolation of the lena quarter-size image is %f', mseqtr_near)

%% Mean Squared Error Lighthouse

%Lighthouse Half
orig = (lighthouse);
new = (lighthouse_half_cubic);
mse_lighthalf_cube = mse_lighthouse(orig,new);
fprintf ('\n\n\nMean Squared error for Lighthouse half-sized:\n\nThe mean squared error for the cubic-spline interpolation of the lighthouse half-size image is %f', mse_lighthalf_cube)

new = (lighthouse_half_linear);
mse_lighthalf_lin = mse_lighthouse(orig,new);
fprintf ('\n\nThe mean squared error for the linear interpolation of the lighthouse half-size image is %f', mse_lighthalf_lin)

new = (lighthouse_half_nearest);
mse_lighthalf_near = mse_lighthouse(orig,new);
fprintf ('\n\nThe mean squared error for the nearest-neighbor interpolation of the lighthouse half-size image is %f', mse_lighthalf_near)

%lighthouse Quarter
new = (lighthouse_qtr_cubic);
mse_lightqtr_cube = mse_lighthouse(orig,new);
fprintf ('\n\n\nMean Squared error for Lighthouse quarter-sized:\n\nThe mean squared error for the cubic-spline interpolation of the lighthouse quarter-size image is %f', mse_lightqtr_cube)

new = (lighthouse_qtr_linear);
mse_lightqtr_lin = mse_lighthouse(orig,new);
fprintf ('\n\nThe mean squared error for the linear interpolation of the lighthouse quarter-size image is %f', mse_lightqtr_lin)

new = (lighthouse_qtr_nearest);
mse_lightqtr_near = mse_lighthouse(orig,new);
fprintf ('\n\nThe mean squared error for the nearest-neighbor interpolation of the lighthouse quarter-size image is %f', mse_lightqtr_near)













