% Autor: Micha� Bernardelli
% Metoda Newtona

% Przyk�ady u�ycia:
% x = newton(@sin,@cos,2,100,1e-6)
% [x, y] = newton(@f,@df,10,100,10^-10)


function [x, y] = newton(f, df, x0, iter, epsilon)
    % opis argument�w:
    %   f - nazwa funkcji
    %   df - nazwa pochodnej funkcji
    %   x0 - przybli�enie pocz�tkowe
    %   iter - maksymalna liczba iteracji
    %   epsilon - dok�adno��, z jak� szukane jest rozwi�zanie
    % opis zwracanych warto�ci:
    %   x - wektor kolejnych przybli�e� rozwi�zania
    %   y - wektor warto�ci funkcji kolejnych przybli�e� rozwi�zania

    i = 1;
    x(i) = x0;
    y(i) = f(x(i));
    dfx = df(x(i));
    
    while ((abs(y(i)) > epsilon) && (i < iter))
        if (dfx == 0)
            x(i+1) = x(i);
            y(i+1) = y(i);
        else
            x(i+1) = x(i) - y(i)/dfx;
            y(i+1) = f(x(i+1));
            dfx = df(x(i+1));
        endif
        i++;
    endwhile
endfunction
