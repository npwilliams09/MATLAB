%%image resize Script
clc;
clear;

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

figure(1)
imshow(lighthouse_half_nearest)

figure(2)
imshow(lighthouse_qtr_linear)

figure(3)
imshow(lena_half_cubic)
