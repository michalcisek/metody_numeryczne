n = 3; %wymiar macierz
alfa = 5; %elementy diagonali
tolerancja = 0.0000001; %tolerancja bledu

diagonala = alfa*ones(n,1);
upper = ones(n-1,1);
lower = ones(n-1,1);

b = ones(n,1);

max_iter = 100; %maksymalna liczba iteracji
x0 = zeros(n,1); %wartosci poczatkowe
error = tolerancja +1;
i = 1;

while (error > tolerancja) && (i < max_iter)
  x1 = ([0; x0(1:n-1)] + [x0(2:n); 0] + b)./diagonala;
  
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