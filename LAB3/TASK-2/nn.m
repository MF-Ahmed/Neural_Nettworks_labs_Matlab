
function out=nn(x,w,t)
  [m c]=min(dist2(w,x));
  out = t(c',:);
end
