
clc;clear all;
close all;clc;

%Load Data in the format specified in readdigits.m file
rawdata=load('semeion.data');   %Load Data
X = rawdata(:,1:256);   %Feature vectors - pixels 
N = size(X,1);  %Number of training examples
T = rawdata(:,end-9:end);   %Class Labels - ( 0, 1, 2 ... 9)
T = sign(T(:,[2:end 1])-0.5);  %Putting label for 0 in the last (1,2,3 ... 9 0)

[rr,cc]=size(X);


for i=1:rr  % for all training set 
    for j=1:10
       if (T(i,j)==1)
          target_dataset(i,1)=mod(j,10);% specify the classes form 0 to 9
       end
    end
end
sens = zeros(5,1); % for Five Experimants
spec=zeros(5,1);
sens1=zeros(5,1);
spec1=zeros(5,1);
N=[10 50 100 250 500 ]; % for these no of testset samples

for i=1:5

[spec(i),sens(i),spec1(i),sens1(i),best_digit, worst_digit] = random(N(i),target_dataset,X)
fprintf('\n\rBest Digit = %d \n\r',best_digit);
fprintf('Worst Digit = %d \n\r',worst_digit);
end


    figure;
    subplot(2,2,1)
     
    plot(sens);
    xlabel('Sensitivity Best Case - Random Case');
    subplot(2,2,2)
    plot(spec);
    xlabel('Specificity Best Case - Random Case');
    subplot(2,2,3)
    plot(sens1);
    xlabel('Sensitivity worst Case - Random Case');
    subplot(2,2,4)
    plot(spec1);
    xlabel('Specificity Worst Case - Random Case');
    
