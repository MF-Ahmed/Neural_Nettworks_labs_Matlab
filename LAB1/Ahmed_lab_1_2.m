% In This problem we first manually find a solution to our data
% set. We find a seperating hyperplane manually . and then
% we perform a number of Pertubations for other possible solutions
% and calculate the average number of errors


clc;clear all;
close all;
X=csvread('dataset2.txt')  % comma seperated values read
s=size(X);
error=0;

for(i=1:s)
    if X(i,3)==1
        axis([0 1 0 1]);
        plot(X(i,1),X(i,2),'+r');
        class1=[X(i,3)];
        hold on;
    end
    if X(i,3)==-1
        plot(X(i,1),X(i,2),'*b');
        class2=[X(i,3)];
        hold on;
    end
    
end

w0 = 1;
w1 = 1;
w2 = -1;
w = [w0 ,w1, w2];
x=[0 :0.1: 1];
y = -(w0/w1)*x - (w2/w1);

plot(x,y,'-r');
hold on
%      %ax+by+c=0

max = 0.1*norm(w);   % 10% of max morm of weight vactor
pert_values = 0:max/10:max; % pertubation array 
num_pert = length(pert_values);
errors = zeros(num_pert,100); % errors container 

for i = 1: num_pert% form minimum to 10% of Maximum of Weight vactor
     
    for j = 1:100 % for 100 random vactors(pertubations)
        rand_vac=rand(1,3);
        urand_vac=rand_vac/norm(rand_vac);
        pert = w + (urand_vac*pert_values(i));
        
        W0 = pert(1);
        W1 = pert(2);
        W2 = pert(3);
        
        %ax+by+c=0
        %Plot
        y = -(W0/W1)*x -(W2/W1);
        plot(x,y,'-g');
        
        for k=1:s
            if(pert*[X(k,1:2) 1]' > 0)
                pred = 1;
            else
                pred = -1;
            end
            
            if(pred ~= X(k,3))
                errors(i,j) = errors(i,j) + 1;
            end
        end
        
                     
    end
end

avg_errors = zeros(1,num_pert);
for i = 1:num_pert
avg_errors(i) = sum(errors(i,:))/100;  % Calculate average errors
end

figure;
plot(avg_errors,'*r')
title('2nd Training set Average errors');
% Result
% In this dataset we are  Unfortunately unable to find 
% any linearly separable hyperplanes. Hence to given dataset is not 
% linearly seperable.


