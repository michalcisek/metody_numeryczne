% Autor: Micha³ Bernardelli
% 2009.10.14
% Wprowadzenie do Octave: 
%   operacje na macierzach

% przyklady wywolania programu:
% n = 10
% n = 30

    % wprowadzanie danych
n = input("Podaj rozmiar macierzy:\n");

    % macierz trojdiagonalna rozmiaru n na n
A = diag(-2*ones(1,n),0) + diag(ones(1,n-1),-1) + diag(ones(1,n-1),+1);
fprintf("Wymiar macierzy A: %dx%d\n", size(A));
fprintf("Transpozycja macierzy A:\n");
disp(A');
fprintf("Wyznacznik macierzy A: %f\n", det(A));
fprintf("Wskaznik uwarunkowania macierzy A: %f\n", cond(A));
fprintf("Macierz odwrotna do macierzy A:\n");
B = A^-1;
disp(B);
fprintf("Sprawdzenie A*A^-1:\n");
disp(A*B);
fprintf("Wartosci wlasne macierzy A:\n");
disp(eig(A));
fprintf("Element A(2,2)=%.2f\n", A(2,2));
fprintf("Podmacierz A(1:%d,:)\n", ceil(n/2));
disp(A(1:ceil(n/2),:));
fprintf("mnozenie (potegowanie) macierzy: A^3\n");
disp(A^3);
fprintf("mnozenie (potegowanie) po wspolrzednych: A.^3\n");
disp(A.^3);

    % wektor prawej strony - same jedynki
b = ones(n,1);
    % rozwiazanie ukladu rownan: Ax = b (bez odwracania macierzy!)
x = A\b;
fprintf("Blad rozwiazania w normie drugiej: %.6e\n",norm(A*x-b,2));

    % zapisanie macierzy do pliku
save -ascii macierz_A.txt A
    % usuniecie zmiennej A z pamieci
clear A
    % wczytanie macierzy z pliku
load macierz_A.txt
A = macierz_A;
