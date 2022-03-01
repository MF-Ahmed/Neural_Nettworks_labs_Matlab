function [Y,u]=kmeans(x,k)
[np,d]= size(x);

Y = zeros(k,d);
for i=1:k
    r = round(1+(np-1).*rand(1,1));  % selecting random points on training set form 
    Y(i,:) = x(r,:);
end
    
u=zeros(np,k); %initlize u as zeros
nepochs = 100;
diff=1;
n=0;

while( n<nepochs && diff ~=0)
     D= 0;
 for L=1:np
     for i=1:k 
     d(L,i) = dist2( x(L,:),Y(i,:) );
     end
     [dis,I]=min(d(L,:));%returns the index of the minimum value  
     u(L,:) = zeros(1,k);
     u(L,I)=1;
     D = D+dis;    
  end  
  
Yprev = Y;  
Y = u' * x; % this is a matrix with k rows; each row is a sum of points
s = sum(u); % this is a vector with k entries; each entry is the number of points in a cluster
for j = 1:k
   Y(j,:)=Y(j,:)./s(j);  % this turns each sum into a mean
end

diff = sum(sum(Y - Yprev));
 n=n+1;
    subplot(2,1,1);
    plot(n,D,'ro','linewidth',2);
    title('No. of Iterations Vs Distortion');
    hold on;
    subplot(2,1,2); 
%     for i=1:np
%              if(u(i,1)==1)
%                  plot(x(i,1),x(i,2),'*r');
%                  hold on
%              end
%              
%              if(u(i,2)==1)
%                  plot(x(i,1),x(i,2),'x');
%                  hold on
%              end
%              
%              if(u(i,3)==1)
%                  plot(x(i,1),x(i,2),'s');
%                  hold on
%              end
%              
%              if(u(i,4)==1)
%                  plot(x(i,1),x(i,2),'+');
%                  hold on
%              end
%              
%     end
%              
             
   plot(x(:,1),x(:,2),'*r');
    
    title('K Means Clusting');
    hold on
    plot(Y(:,1),Y(:,2),'bo');
    pause(0.6);
    hold off
   
    
end


end