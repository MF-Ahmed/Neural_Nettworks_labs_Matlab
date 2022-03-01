% Implementation of Adaline on_line learning (Delta rule)
close all; clear all;clc;   % To clearup things a littile bit

%%%%%%%%%%%%%%%% Loading data and performing house keeping %%%%%%
Ts = textread('iris.txt');   % Load sample training set.
L = size(Ts,1); % Number of Training samples
T = Ts(:,end); % class Lables.
F = Ts(:,1:end-1); % Feature Vactor.
X = [F ones(L,1)];  % add one to last colunm for Bias
J = size(X,2);   % get no of feature vactors + bias
W = rand(1,J);  % generate random set(row vactor) of weights

%%%%%%%%%%%%%%%%%%%  Definning intial Values %%%%%%%%%%%%%%%%%%%
eta = 0.001; % learning rate.
flag = -1;  % for loop termination when flag = 0;
max_iter = 1000; % for Emergency / force stop
maxMse = 0.1;   %Maximum mean squared error allowed (percentage change in MSE). 
niter = 0;  %count number  
mse = 0; % Mean squared error initlize.
% gr = 0;
% grad_max = 10;
% Least Mean Square rule / Delta Rule.

while(flag ==-1 && niter <= max_iter)
    mse_old = mse;
%     grad_old = gr;
    mse = 0;
     for i=1:L
         delta = (T(i) - (W * Ts(i,:)'));
         W = W  + 2 * eta * delta * Ts(i,:);  % update weights
         mse = mse + delta.^2;      % calculate Mean square error
         gr=2*delta*Ts(i,:);        % calculate gradient
%          norm_grad = norm(gr);       % norm of gradient
     end
     if (abs(mse - mse_old) * 100 <= maxMse)  % if %Absolute value if less then maxMse 
         flag=0;
     end
     niter = niter +1;
end

if(niter >= max_iter)
    fprintf('Failure to achieve any solution. No. if iterations = %d',niter);
else
    fprintf('Success ! converged in %d interations With MSE = %5f' ,niter,mse);
end


