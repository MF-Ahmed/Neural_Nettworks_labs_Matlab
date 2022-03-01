% Classify Hand Written digits using  Adaline (LMS) algorithm
clc;clear all;
close all;clc;

%Load Data in the format specified in readdigits.m file
rawdata=load('semeion.data');   %Load Data
X = rawdata(:,1:256);   %Feature vectors - pixels 
N = size(X,1);  %Number of training examples
Td = [X ones(N,1)];  %Add ones corresponding to bias weight
T = rawdata(:,end-9:end);   %Class Labels - ( 0, 1, 2 ... 9)
clear('rawdata');
T = sign(T(:,[2:end 1])-0.5);  %Putting label for 0 in the last (1,2,3 ... 9 0)
eta = 10^-5;    %learning rate

%Check performance 
pred = zeros(N,10);
tic   % start timer to keep record of time lapsed
%For recognizing the digits 1,2... 9,0
for j = 1: 10
    w = Adaline(Td(1:N,:),T(1:N,j),eta);
    for i = 1:N
        if(w*Td(i,:)'>=0)
            pred(i,j) = 1;
        else
            pred(i,j) = -1;
        end
    end
 
end

errorsMat = 0.5*abs(pred - T);
errors = sum(errorsMat)
errorsPercentage = (errors/N)*100 
sum=sum(errorsPercentage)
toc     % stop timer and display elapsed time
