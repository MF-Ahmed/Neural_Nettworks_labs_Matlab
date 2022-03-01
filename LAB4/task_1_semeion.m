close all;clear all,clc;
rawdata=load('semeion.data');
x1=rawdata(:,1:256);
t=rawdata(:,end-9:end);
clear('rawdata');
t=sign(t(:,[2:end 1])-.5);
[b,c]=size(x1);
n=20;%no. of patterns
x=x1(1:n,:);
nh=10;
[whi woh] = backprop(x,t,nh);
