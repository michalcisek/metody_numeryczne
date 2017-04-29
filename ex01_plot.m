% Autor: Micha³ Bernardelli
% 2009.10.14
% Wprowadzenie do Octave: 
%   wykres funkcji

% przyklady wywolania programu:
% n = 1, k = 100
% n = 3, k = 10000
% n = 0.01, k = 10000

    % wprowadzanie danych
n = input("Podaj liczbe okresow:\n");
    % wypisywanie danych
fprintf("Liczba okresow: %f\n",n);
    % wprowadzanie danych
k = input("Podaj liczbe punktow:\n");
    % wypisywanie danych
fprintf("Liczba punktow: %d\n",k);

    % k rownomiernie rozlozonych punktow na przedziale [0;2*pi*n]
x = linspace(0,2*pi*n,k);
    % wykres funkcji sinus
plot(x,sin(x),"b.-");
    % "wylaczenie odswiezania"
hold on
    % wykres funkcji sin(1/x)
plot(x,sin(1./x),"r-");
    % "wlaczenie odswiezania"
hold off
