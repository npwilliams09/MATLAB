clc;
clear;

%% Interpolation
%import
lighthouse = double(imread('lighthouse.png'));
lighthouse_half = double(imread('lighthouse_half.png'));
lighthouse_qtr = double(imread('lighthouse_quarter.png'));

lena = double(imread('lena.tif'));
lena_half = double(imread('lena_half.tif'));
lena_qtr = double(imread('lena_quarter.tif'));


%interp lighthouse
lighthouse_half_linear = MyInterp(lighthouse_half,lighthouse,'linear'); %calls in function to interp half-size lighthouse image (256x256) to full size 512x512
lighthouse_qtr_linear = MyInterp(lighthouse_qtr,lighthouse,'linear');
lighthouse_half_cubic = MyInterp(lighthouse_half,lighthouse,'spline');
lighthouse_qtr_cubic = MyInterp(lighthouse_qtr,lighthouse,'spline');
lighthouse_half_nearest = MyInterp(lighthouse_half,lighthouse,'nearest');
lighthouse_qtr_nearest = MyInterp(lighthouse_qtr,lighthouse,'nearest');

%interp lena
for i = 1:3 %
   lena_half_linear(:,:,i) = MyInterp(lena_half(:,:,i),lena(:,:,i),'linear');
   lena_qtr_linear(:,:,i) = MyInterp(lena_qtr(:,:,i),lena(:,:,i),'linear');
   lena_half_cubic(:,:,i) = MyInterp(lena_half(:,:,i),lena(:,:,i),'spline');
   lena_qtr_cubic(:,:,i) = MyInterp(lena_qtr(:,:,i),lena(:,:,i),'spline');
   lena_half_nearest(:,:,i) = MyInterp(lena_half(:,:,i),lena(:,:,i),'nearest');
   lena_qtr_nearest(:,:,i) = MyInterp(lena_qtr(:,:,i),lena(:,:,i),'nearest');
end

figure(1)

title 'Lighthouse Half,'
subplot(1,3,1), imshow(uint8(lighthouse_half_linear))
title 'Lighthouse Half, Linear'
subplot(1,3,2), imshow(uint8(lighthouse_half_cubic))
title 'Lighthouse Half, Cubic-Spline'
subplot(1,3,3), imshow(uint8(lighthouse_half_nearest))
title 'Lighthouse Half, Nearest-Neighbor'

figure(2)

subplot(1,3,1), imshow(uint8(lighthouse_qtr_linear))
title 'Lighthouse Quarter, Linear'
subplot(1,3,2), imshow(uint8(lighthouse_qtr_cubic))
title 'Lighthouse Quarter, Cubic-Spline'
subplot(1,3,3), imshow(uint8(lighthouse_qtr_nearest))
title 'Lighthouse Quarter, Nearest-Neighbor'

figure(3)

subplot(1,3,1), imshow(uint8(lena_half_linear))
title 'Lena Half, Linear'
subplot(1,3,2), imshow(uint8(lena_half_cubic))
title 'Lena Half, Cubic-spline'
subplot(1,3,3), imshow(uint8(lena_half_nearest))
title 'Lena Half, Nearest-Neighbor'

figure(4)

subplot(1,3,1), imshow(uint8(lena_qtr_linear))
title 'Lena Quarter, Linear'
subplot(1,3,2), imshow(uint8(lena_qtr_cubic))
title 'Lena Quarter, Cubic-spline'
subplot(1,3,3), imshow(uint8(lena_qtr_nearest))
title 'Lena Quarter, Nearest-Neighbor'


%% Mean Squared Error Lena

% Lena Half
orig = (lena);

new = (lena_half_linear);
mse_lenhalf_lin = mse(orig,new,'clr');
fprintf ('Mean Squared error for Lena half-sized:\n\nThe mean squared error for the linear interpolation of the lena half-size image is %f', mse_lenhalf_lin)

new = (lena_half_cubic);
mse_lenhalf_cube = mse(orig,new,'clr'); %takes advantage of nargin function by adding a redundant third argument to indicate that a 3D array is being used
fprintf ('\n\nThe mean squared error for the cubic-spline interpolation of the lena half-size image is %f', mse_lenhalf_cube)

new = (lena_half_nearest);
mse_lenhalf_near = mse(orig,new,'clr');
fprintf ('\n\nThe mean squared error for the nearest-neighbor interpolation of the lena half-size image is %f', mse_lenhalf_near)

%Lena Quarter
new = (lena_qtr_linear);
mse_lenqtr_lin = mse(orig,new,'clr');
fprintf ('\n\n\nMean Squared error for Lena quarter-sized:\n\nThe mean squared error for the linear interpolation of the lena quarter-size image is %f', mse_lenqtr_lin)

new = (lena_qtr_cubic);
mse_lenqtr_cube = mse(orig,new,'clr');
fprintf ('\n\nThe mean squared error for the cubic-spline interpolation of the lena quarter-size image is %f', mse_lenqtr_cube)

new = (lena_qtr_nearest);
mse_lenqtr_near = mse(orig,new,'clr');
fprintf ('\n\nThe mean squared error for the nearest-neighbor interpolation of the lena quarter-size image is %f', mse_lenqtr_near)

figure (5)
lhx = categorical({'Half-Size','Quarter-Size'});
lhy = [mse_lenhalf_lin mse_lenhalf_cube mse_lenhalf_near; mse_lenqtr_lin mse_lenqtr_cube mse_lenqtr_near];
bar(lhx,lhy)
title 'Lena Mean Squared Error'
xlabel 'Image Size'
ylabel 'Mean Squared Error'
ylim([0 1000])
legend('linear','cubic-spline','nearest-neighbor', 'Location', 'northwest')

%% Mean Squared Error Lighthouse

%Lighthouse Half
orig = (lighthouse);

new = (lighthouse_half_linear);
mse_lighthalf_lin = mse(orig,new);
fprintf ('\n\n\nMean Squared error for Lighthouse half-sized:\n\nThe mean squared error for the linear interpolation of the lighthouse half-size image is %f', mse_lighthalf_lin)

new = (lighthouse_half_cubic);
mse_lighthalf_cube = mse(orig,new);
fprintf ('\n\nThe mean squared error for the cubic-spline interpolation of the lighthouse half-size image is %f', mse_lighthalf_cube)

new = (lighthouse_half_nearest);
mse_lighthalf_near = mse(orig,new);
fprintf ('\n\nThe mean squared error for the nearest-neighbor interpolation of the lighthouse half-size image is %f', mse_lighthalf_near)

%lighthouse Quarter
new = (lighthouse_qtr_linear);
mse_lightqtr_lin = mse(orig,new);
fprintf ('\n\n\nMean Squared error for Lighthouse quarter-sized:\n\nThe mean squared error for the linear interpolation of the lighthouse quarter-size image is %f', mse_lightqtr_lin)

new = (lighthouse_qtr_cubic);
mse_lightqtr_cube = mse(orig,new);
fprintf ('\n\nThe mean squared error for the cubic-spline interpolation of the lighthouse quarter-size image is %f', mse_lightqtr_cube)

new = (lighthouse_qtr_nearest);
mse_lightqtr_near = mse(orig,new);
fprintf ('\n\nThe mean squared error for the nearest-neighbor interpolation of the lighthouse quarter-size image is %f\n', mse_lightqtr_near)

figure(6)
lix = categorical({'Half-Size','Quarter-Size'});
liy = [mse_lighthalf_lin mse_lighthalf_cube mse_lighthalf_near; mse_lightqtr_lin mse_lightqtr_cube mse_lightqtr_near];
b2 = bar(lix,liy);
title 'Lighthouse Mean Squared Error'
xlabel 'Image Size'
ylabel 'Mean Squared Error'
legend('linear','cubic-spline','nearest-neighbor', 'Location', 'northwest')
b2(1).FaceColor = 'b';
b2(2).FaceColor = 'g';
b2(3).FaceColor = 'r';