function [woh whi]=backprop(M,T,nh)
[npatterns,ni]=size(M);
[~,no]=size(T);  % number of output units/layers

nepochs=1000;% number of epochs
eta=0.001;

% intialize all variables
whi=normrnd(0,1,[ni+1 nh]);  %initialize whi and woh as random b/w +1 to -1
woh=normrnd(0,1,[nh+1 no]);
rj=zeros(nh,1);
sh=zeros(nh,1);
rk=zeros(no,1);
so=zeros(no,1);
delta_k=zeros(no,1);
delta_i=zeros(nh,1);
p=zeros(no,1);

final_mse = zeros(nepochs,1);

for n=1:nepochs
    mse=0;  % initialise mse to 0
    dwhi=zeros(nh,ni+1);
    dwoh=zeros(no,nh+1);
    for L=1:npatterns
        
        % activation forward propagation
        % input units + bias -----> Hidden layer/units
        for j=1:nh               
            rj(j,1)=[M(L,:),1]*whi(:,j);
            sh(j,1)=tanh(rj(j,1));                    
        end
        % hidden to output
        for k=1:no 
            rk(k,1)=[sh',1]*woh(:,k);
            so(k,1)=tanh(rk(k,1));           
        end
      
        %error-backward propagation
        % delta K output---------> hidden
        for k=1:no
            delta_k(k,1)=(so(k,1)-T(L,k)')*(1-so(k,1))*(1+so(k,1));
        end
        % delta I hidden --------------> inout
        for j=1:nh
            for k=1:no
                p(k,1)=delta_k(k,1)*(1-sh(j,1))*(1+sh(j,1))*woh(j,k);
            end
            delta_i(j,1)=sum(p)/no;
        end
        
        
        % correction
        dwoh=dwoh-eta.*delta_k*[sh',1];
        dwhi=dwhi-eta.*delta_i*[M(L,:),1];
        % mean square error
     
        mse=mse+mean((so-T(L,:)').^2);
    end
    woh=woh+dwoh'; % Apply update training by epoh
    whi=whi+dwhi'; % Apply update training by epoh
    final_mse(n,1)=mse/npatterns;

    
end


plot(1:nepochs,final_mse);
Title('MSE Backpropagation');
end
% Skeleton pseudo-code:
% initialize activations sh and so (zeros)
% add column of ones to training set and to hidden units sh
% %main loop
% for t=1:nepochs
%   initialize mse (zero)
%   for l=1:npatterns
%     % feedforward step
%     compute sh and so
%     % back-propagation step
%     compute deltao and dwoh
%     compute deltah and dwhi
%     update mse=mse+mean((so-t(l,:)).^2) (mean of all outputs)
%   end
%   apply weight update woh=woh+dwoh, whi=whi+dwhi
%   compute final mse = mse/npatterns
% end
% %finalizations, if necessary

