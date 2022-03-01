% Iris data classification problem
clc;clear all;
close all;

T = textread('iris-2class.txt'); % [sepal l sepal w petal l petal w class]
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
xlabel('Sepal Area');
ylabel('Petal Area');

w = myPerceptron(X,Y,eta);

xlabel('Sepal Area');
ylabel('Petal Area');
w2 = w(1); w1 = w(2); w0 = w(3);
xs = min(X(:,1)):0.1:max(X(:,1));
ys = -(w2/w1).*xs - (w0/w1); 
plot(xs,ys);

