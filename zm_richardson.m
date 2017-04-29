function [y] = zm_richardson(A, b, x0)
  tmp = abs(eig(A));
  tau = 2/(min(tmp) + max(tmp));
  y = x0 + tau*(b-A*x0);
endfunction