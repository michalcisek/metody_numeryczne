clear
	% rozmiar macierzy
n = 5;
	% parametry
alfa = 3;
maxiter = 1000;
dokl = 1e-8;

	% macierz diagonalna
%A = alfa*eye(n);
	% macierz tr�jdiagonalna
%A = alfa*diag(ones(n,1))-diag(ones(n-1,1),1)-diag(ones(n-1,1),-1);
	% macierz Hilberta
A = hilb(n);
	% wektor prawej strony
b = ones(n,1);
	% rozwi�zanie uzyskane wbudowanym w Octave operatorem \
xreal = A\b;

	% BEGIN: metoda Jacobiego
resJ(1) = norm(b);
roznica = 999;
xJ = zeros(n,1);
k = 2;
A1 = diag(1./diag(A)) * (diag(diag(A))-A);
b1 = b ./ diag(A);
while ((k < maxiter) && (roznica > dokl))
  y = b1 + A1*xJ;
  resJ(k) = norm(b-A*y);
  roznica = norm(y-xJ);
  xJ = y;
  k++;
endwhile
	% END: metoda Jacobiego

	% BEGIN: metoda Richardsona
tmp = abs(eig(A));
tau = 2/(min(tmp) + max(tmp));
resR(1) = norm(b);
roznica = 999;
xR = zeros(n,1);
k = 2;
while ((k < maxiter) && (roznica > dokl))
  y = xR + tau*(b-A*xR);
  resR(k) = norm(b-A*y);
  roznica = norm(y-xR);
  xR = y;
  k++;
endwhile
	% END: metoda Richardsona
	
	% wy�wietlenie wynik�w
printf('Porownanie wyniku faktycznego z wynikiem dzialania metody Jacobiego:\n %.16f\n', norm(xJ-xreal));
printf('Porownanie wyniku faktycznego z wynikiem dzialania metody Richardsona:\n %.16f\n', norm(xR-xreal));
printf('Liczba iteracji metody Jacobiego %d\n', max(size(resJ)));
printf('Liczba iteracji metody Richardsona %d\n', max(size(resR)));
plot(1:max(size(resJ)),resJ,'b',1:max(size(resR)),resR,'r')
legend('Jacobi', 'Richardson')