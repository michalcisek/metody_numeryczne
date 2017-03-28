n = input("Wprowadz rozmiar wektora: \n");

x = ones(n,1);

function  [wynik] = norma (x, p)
	if p==Inf
		wynik = max(abs(x));
	else
		wynik = nthroot(sum(abs(x).^p), p);
	endif
endfunction

printf("Norma pierwsza wynosi: %d",norma(x,1));
printf("\n");
printf("Norma druga wynosi: %d",norma(x,2));
printf("\n");
printf("Norma dziesiata wynosi: %d",norma(x,10));
printf("\n");
printf("Norma nieskonczonosc wynosi: %d",norma(x,Inf));
printf("\n");
printf("\n");

plot([1; 2; 10; 20], [norma(x,1); norma(x,2); norma(x,10); norma(x,Inf)])
set(gca, 'xtick', [1 2 10 20]) 
set(gca, 'xticklabel', {'1', '2', '10', 'Inf'})


x = randn(n,1);
printf("Losowy wektor: \n");
disp(x);

printf("Norma pierwsza wynosi: %d",norma(x,1));
printf("\n");
printf("Norma druga wynosi: %d",norma(x,2));
printf("\n");
printf("Norma dziesiata wynosi: %d",norma(x,10));
printf("\n");
printf("Norma nieskonczonosc wynosi: %d",norma(x,Inf));
printf("\n");

plot([1; 2; 10; 20], [norma(x,1); norma(x,2); norma(x,10); norma(x,Inf)])
set(gca, 'xtick', [1 2 10 20]) 
set(gca, 'xticklabel', {'1', '2', '10', 'Inf'})
