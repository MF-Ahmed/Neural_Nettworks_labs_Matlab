
%       This function implements the Roseblatt's perceptron.              %
% Input = X -> Training Data (with columns as feature vectors)            %
%         Y -> Correponding Class Label of the training data              %
%         eta -> Learning Rate                                            %


function w = myPerceptron(X,Y,eta)

N = size(X,1);  %Number of training examples
M = size(X,2);  %Number of features + 1 (to take care of bias term)
w = rand(1,M);  %Create a initial weight vector randomly.

flag = -1;  %Process terminates when flag = 1.
nIter = 0;  %No. of iterations to find the weights
maxIter = 100; %Maximum number of iteration before search for linearly separable hyperplane continues.

while (flag==-1 && nIter<= maxIter) %Run until correct weights are found or counter exceeds max iterations
    numErrors = 0;  %keep track of number of errors in each iteration  
    
    for i = 1:N %For all training examples
        w_prev = w;
        r = w*X(i,:)';  % Net input on neuron membrane 
        a = sign(r);    %Output of neuron
        err =  0.5*(Y(i)-a);    %error term
       
        %Count number of errors made by hyperplane (corresponding to current set of weights)
        if(err~=0)
            numErrors = numErrors + 1;
        end
        
        %Update Rule w = w + eta*(y-a)*x
        dw = eta*err*X(i,:); %delta(w) or correction
        w = w + dw;
    end
    
    nIter = nIter + 1;  %Count number of iterations to converge
    if(numErrors==0)
        flag = 0;   %Change flag when no errors are made by line (hyperplane) (corresponding to current set of weights)
    end
    
end

%Display Message if successful or unsuccessful
if(nIter>maxIter)
    display('Unsucessful attempt !!! Solution does not converge ');
else
    display(nIter) 
    display('Sucessful attempt !!! Found weight vector');
end
    


end