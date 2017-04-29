clear;

%zdefiniowanie danych wejsciowych
%A = hilb(4);
n=4;
alfa = 4;
A = alfa*diag(ones(n,1))-diag(ones(n-1,1),1)-diag(ones(n-1,1),-1);
b = ones(4,1);


%zdefiniowanie wektora kolejno stosowanych metod iteracyjnych
%order = [1 2 3 3];
order = ones(100,1)';

%zdefiniowanie macierzy rozwiazan przyblizonych w kolejnych krokach
x0 = zeros(4,1);
x = zeros(size(order)(2) + 1, size(b)(1));
x(1,:) = x0;


for i = 1:1:size(order)(2)
  x_temp = x(i,:)';  

  if order(i) == 1
    x(i+1,:) = zm_jacobi(A, b, x_temp);
  elseif order(i) == 2
    x(i+1,:) = zm_richardson(A, b, x_temp);  
  elseif order(i) == 3
    x(i+1,:) = zm_gauss_seidel(A, b, x_temp);    
  end
endfor