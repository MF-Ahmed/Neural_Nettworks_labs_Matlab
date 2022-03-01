clc;close all;clear all;
x=load('dataset1.txt');
[rr,cc]=size(x);
T = [x(:,3)];
nh = 2;
N = size(x,1);% depth of feature vactors(no. of patterns)
M = [x(:,1:end-1)];% feature vactor
[woh whi]=backprop(M,T,nh)
[so]=mlptest(whi,woh,M,T,nh)

