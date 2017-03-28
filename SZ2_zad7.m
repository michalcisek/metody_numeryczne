A = [10^-2 0.5*sqrt(2-(10^-4)); 0.5*sqrt(2-(10^-4)) 10^2];

wart_wlasne = eig(A'*A);

cond = sqrt(max(abs(wart_wlasne))/min(abs(wart_wlasne)));

printf("Wspolczynnik uwarunkowania macierzy wynosi: %d", cond);
printf("\n");