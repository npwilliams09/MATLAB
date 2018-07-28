function [ MSE ] = mse(orig,new,varargin)

x = (new - orig).^2;
if nargin == 3
    y = sum(sum(sum(x)));
    MSE = y / (512*512*3);

else
    y = sum(sum(x));
    MSE = y / (512*512);
end