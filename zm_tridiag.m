function [y] = zm_tridiag(A, b, x0)
  M = diag(diag(A, -1), -1) + diag(diag(A)) + diag(diag(A, 1), 1);
  N = M - A;
  inv_M = M^-1;
  %inv_M = inv(M) 
  
  A1 = inv_M * N;
  b1 = inv_M * b;
  y = b1 + A1*x0;
endfunction  