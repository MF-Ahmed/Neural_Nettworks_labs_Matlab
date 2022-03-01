
function [y]=neural_gas(x,k)

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
    x=x(randperm(np),:);
    eta = (eta0 - etaf)*((nepochs - n)/(nepochs-1)) + etaf; %Update learning rate linear decay
    g=eta; % g varies from eta0 to etaf form (1 to 0);
    for i=1:np
        %computing distance of x from all prototypes y
        for j=1:k
            d(i,j)=dist2(x(i,:),y(j,:));% compute distance of x from all prototypes y
        end
        [~,ind]=sort(d(i,:));  % sort elements in ascending order
        [~,r]=sort(ind);%the nearest prototype (winner) has distance 0;
                        %the second nearest has distance 1; the third nearest has distance 2
        %computing h for all prototypes
        rank=r-1;
        h=zeros(1,k);
        for j=1:k
            h(1,j)=exp(-rank(1,j)/g);%h decrease exponentially with the rank
            y(j,:)=y(j,:)+h(1,j)*eta*(x(i,:)-y(j,:));% apply update
        end
        
    end
    %D=sum(sum(d))   % compute distortion (Average distance b/w pattern and its nearest neighbor)
    
    n=n+1; % update nepochs
    plot(x(:,1),x(:,2),'*r');%plot results for visulization
    title('Neural Gas');
    hold on
    plot(y(:,1),y(:,2),'bO');
    pause(0.01);
    hold off
end
end