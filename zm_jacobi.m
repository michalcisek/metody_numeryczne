function [y] = zm_jacobi(A, b, x0)
  A1 = diag(1./diag(A)) * (diag(diag(A))-A);
  b1 = b ./ diag(A);
  y = b1 + A1*x0;
endfunction  