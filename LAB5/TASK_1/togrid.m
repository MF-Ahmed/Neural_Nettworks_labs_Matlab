function [row, col] = togrid(j,numcol)
  col = mod( ( j - 1 ) , numcol ) + 1;
  row = ceil ( j  / numcol );
end
