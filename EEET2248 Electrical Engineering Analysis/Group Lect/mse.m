function [ MSE ] = mse(orig,new,varargin)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x = (new - orig).^2;
if nargin == 3
    y = sum(sum(sum(x)));
else
    y = sum(sum(x));
end

MSE = y / (512*512);


end

