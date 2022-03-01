function [so]=mlptest(whi,woh,x,T,nh)


[npatterns,~]=size(x);    
[~,no]=size(T);
sh=zeros(nh,1);
so=zeros(no,1);
mse=0;
 for L=1:npatterns
        
        % activation forward propagation
        % input units + bias -----> Hidden layer/units
        for j=1:nh               
            rj(j,1)=[x(L,:),1]*whi(:,j);
            sh(j,1)=tanh(rj(j,1));                    
        end
        % hidden to output
        for k=1:no 
            rk(k,1)=[sh',1]*woh(:,k);
            so(k,1)=tanh(rk(k,1));           
        end
        mse=mse+mean((so-T(L,:)').^2)
 end
 final_mse=mse/npatterns


end