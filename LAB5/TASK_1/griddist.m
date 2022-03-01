function d = griddist(j,k,numcol)
  [r1, c1] = togrid(j,numcol);
  [r2, c2] = togrid(k,numcol);
  d = abs(r1-r2)+abs(c1-c2);
end
