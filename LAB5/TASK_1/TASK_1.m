clc;close all;clear all;
x = load('iris.txt');
x = [x(:,1:end-1)];
x=[x(:,1),x(:,2)];  % initially use only two inputs
k=2;
[Y,u]=kmeans(x,k);







