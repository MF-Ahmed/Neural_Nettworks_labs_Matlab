function [y]=kohonen_SOM(x,k)

[np,d]= size(x);% initialize
Y = zeros(k,d);
u=zeros(np,k); %initlize u as zeros
nepochs = 100;
n=1;
a=0;
b=np;
eta0=1;% max value of learning rate
etaf=0;% final eta
for i=1:k
    r = round(a+(b-a).*rand(1,1));  % selecting random points on training set form 
    y(i,:) = x(r,:);
end
numcol=sqrt(k);
while( n<nepochs)
    D=0;
    x=x(randperm(np),:); % Shuffle x on each epoch
    eta = (eta0 - etaf)*((nepochs - n)/(nepochs-1)) + etaf; %Update learning rate linear decay
    g=eta; % g varies from eta0 to etaf form (1 to 0);
    for i=1:np
        %computing distance of x from all prototypes y
        for j=1:k
            d(i,j)=dist2(x(i,:),y(j,:));% compute distance of x from all prototypes y
        end
        [dis,ind]=min(d(i,:));
        D=D+dis;
    for j=1:k  
        hop = griddist(j,ind,numcol); % calculate no. of hops
        if  j~=ind
            h=exp(-hop^2/g);% udpate h
        else
            h=1;  % winner prototype
        end
        y(j,:)=y(j,:)+h*eta*(x(i,:)-y(j,:));% apply update
       end 
    end
   
    D  %print distrotion 
    n=n+1; % update nepochs
    plot(x(:,1),x(:,2),'*r');%plot results for visulization
    title('Kohonens Self Orgamizing Map');
    hold on
    plot(y(:,1),y(:,2),'bO');
    pause(0.01);
    hold off
end

end