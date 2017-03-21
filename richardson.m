n = 3;
alfa = 5;

A= alfa*diag(ones(n,1)) + (-1)*diag(ones(n-1,1),1) + (-1)*diag(ones(n-1,1),-1);

wart_wlasne = eig(A);
tau=2/(max(wart_wlasne)+min(wart_wlasne));

tolerancja = 0.000000001; %tolerancja bledu

b = ones(n,1);

max_iter = 100; %maksymalna liczba iteracji
x0 = zeros(n,1); %wartosci poczatkowe
error = tolerancja +1;
i = 1;

while (error > tolerancja) && (i < max_iter)
  x1 = x0 + tau*(b - A*x0);
  
  error = max(abs(x1 - x0));
  x0 = x1;
  i = i+1;
endwhile

if error <= tolerancja
  printf("Zbieznosc osiagnieta! \n");
  printf("Liczba iteracji: %g", i);
  printf("\n");
  printf("Rozwiazanie: \n");
  disp(x1);
else
  printf("Brak zbieznosci! \n");
endif