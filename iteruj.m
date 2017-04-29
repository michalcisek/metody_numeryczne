
function [y] = iteruj(A, b, order)

  %zdefiniowanie macierzy rozwiazan przyblizonych w kolejnych krokach
  x0 = zeros(size(b)(1), 1);
  x = zeros(size(order)(1) + 1, size(b)(1));
  x(1,:) = x0;


  for i = 1:1:size(order)(2)
    x_temp = x(i,:)';  

    if order(i) == 1
      x(i+1,:) = zm_jacobi(A, b, x_temp);
    elseif order(i) == 2
      x(i+1,:) = zm_richardson(A, b, x_temp);  
    elseif order(i) == 3
      x(i+1,:) = zm_gauss_seidel(A, b, x_temp);
    elseif order(i) == 4
      x(i+1,:) = zm_tridiag(A, b, x_temp);
    endif
  endfor

  y = x(size(order)(1)+1, :)';  
endfunction  