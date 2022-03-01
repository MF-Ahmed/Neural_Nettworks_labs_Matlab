 

function W = Adaline(Ts,T,eta)

    L = size(Ts,1); % Number of Training samples  
    J = size(Ts,2);   % get no of feature vactors + bias
    W = rand(1,J);  % generate random set(row vactor) of weights
ab = fopen('test.txt','w'); 
    %%%%%%%%%%%%%%%%%%%  Definning intial Values %%%%%%%%%%%%%%%%%%%
    flag = -1;  % for loop termination when flag = 0;
    max_iter = 1000; % for Emergency / force stop
    maxMse = 10^2;   %Maximum mean squared error allowed (percentage change in MSE). 
    niter = 0;  %count number  
    mse = 0; % Mean squared error initlize.

    % Least Mean Square rule / Delta Rule.
    
    while(flag ==-1 && niter <= max_iter)
        mse_old = mse;      % save mse
        mse = 0;            % clear mse
        for i=1:L
            delta = (T(i) - (W * Ts(i,:)'));
            W = W  + 2 * eta * delta * Ts(i,:);  % update weights
            mse = mse + delta.^2;      % calculate Mean square error
        end
        if (abs(mse - mse_old) * 100 <= maxMse)  % if %Absolute value if less then maxMse then exit
         flag=0;
        end
        niter = niter +1;
    end

    if(niter >= max_iter)
        fprintf('Failure to achieve any solution.Did Not Converg No. if iterations = %d',niter);
        
    else
        fprintf('Success ! converged in %d interations With MSE = %5f \n' ,niter,mse);
        
        fprintf(ab,'No. of Iterations = %4d  Mean Square Errors = %5f\n\r',niter,mse);
        %fprintf(fileID,'%6.2f %12.8f\n',A);
        
    end
    fclose(ab);
   
end
