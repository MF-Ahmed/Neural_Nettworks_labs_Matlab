clc,clear all,close all;
% 1.	one with class 1 as 1 and 2 and 3 as -1;



T = textread('iris.txt'); % [sepal l sepal w petal l petal w class]
[rr,cc]=size(T);
T1=[T(1:rr,1:cc-1)];
T1=[T1,ones(rr,1)]

for i=rr/3+1:rr
        T1(i,5)=-1;
    
end
T = T1;;%Task set1 
X = [T(:,1).*T(:,2) T(:,3).*T(:,4)]; % feature vectors sepal area - petal area
N = size(X,1);  %Number of training examples.
X = [X ones(N,1)]; % Add column of ones to take care about bias.
Y = T(:,5); %Class Labels
w = rand(1,3);  % Initial random weights.
eta = 0.1;  %learning rate

figure; %Plot data points
for i = 1:N
   
   if(Y(i)==1) 
       plot(X(i,1),X(i,2),'+r');
       hold on;
   else
       plot(X(i,1),X(i,2),'*b');
       hold on;
   end
   
end


w = myPerceptron(X,Y,eta);

xlabel('Sepal Area');
ylabel('Petal Area');
title('class one 1 and Class 2&3 as -1');
w2 = w(1); w1 = w(2); w0 = w(3);
xs = min(X(:,1)):0.1:max(X(:,1));
ys = -(w2/w1).*xs - (w0/w1); 
plot(xs,ys);
