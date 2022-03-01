
clc;clear all;close all;

X=load('dataset3.2.txt');
rr= size(X,1);
cc= size(X,2);
%% Assigning Class labels  to Data set
%% 1st Half as -1 and 2nd Half as 1

for i=1:rr/2
    X(i,3)= -1;
end

for i=rr/2+1:rr
    X(i,3)= 1;
end

for i=1:rr
    if(X(i,3)== -1)
        plot(X(i,1),X(i,2),'+b');
        hold on;
        
    end

    if(X(i,3)== 1)
        plot(X(i,1),X(i,2),'*r');
        hold on;
       
    end
end



N = size(X,1);  % no of Training samples 
D = X;
D(:,3)=[];
datset = [ D ones(N,1)];  % add 1 for Bias
T = X(:,3);  % Training sapmles

eta0 = 0.001;  % initial Max Value of eta
etaf = 0.0001;  % final Min Value of Eta.

%%%    Finding Solution Using Perceptron %%%%%% 
w = Perceptron(datset,T,eta0,etaf);
w2 = w(1); w1 = w(2); w0 = w(3);
xs = min(X(:,1)):0.1:max(X(:,1));
ys = -(w2/w1).*xs - (w0/w1); 
plot(xs,ys,'r');  % RED color of Percepntron Hyper plane
hold on;


%%%    Finding Solution Using Adaline %%%%%% 
w = Adaline(datset,T,eta0,etaf);
w2 = w(1); w1 = w(2); w0 = w(3);
xs = min(X(:,1)):0.1:max(X(:,1));
ys = -(w2/w1).*xs - (w0/w1); 
plot(xs,ys,'b');% BLUE color of Adaline Hyper plane
hold on;



%%%   Plotting line perpendicular ot Mean of Two Classes %%%%%% 

class1 = X(1:(N/2-1),1:2);
class2 = X(N/2:N,1:2);
m1=mean(class1);
m2=mean(class2);
s1 = (m2(2)-m1(2))/(m2(1) - m1(1));
mid_m = (m1+m2)/2;
s2 = -1/s1;    %Slope of separating line
mid = (m1 + m2)/2 ; % midpoint of two means
axis([-2 2 -0.3 1]);  % define axis to have better view
ys= s2*xs - (mid(1)*s2 + mid(2));
hold on;
plot(xs,ys,'g');  % GREEN  color perpendicular line;
title('Dataset 2');
grid on;


