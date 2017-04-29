function [y] = zm_gauss_seidel(A, b, x0)
  M = tril(A);
  N = (triu(A)-diag(diag(A))) * (-1);
  inv_M = M^-1;
  %inv_M = inv(M)
  
  A1 = inv_M * N;
  b1 = inv_M * b;
  y = b1 + A1*x0;
endfunction  