% Autor: Micha³ Bernardelli
% Metoda Newtona

% Przyk³ady u¿ycia:
% x = newton(@sin,@cos,2,100,1e-6)
% [x, y] = newton(@f,@df,10,100,10^-10)


function [x, y] = newton(f, df, x0, iter, epsilon)
    % opis argumentów:
    %   f - nazwa funkcji
    %   df - nazwa pochodnej funkcji
    %   x0 - przybli¿enie pocz¹tkowe
    %   iter - maksymalna liczba iteracji
    %   epsilon - dok³adnoœæ, z jak¹ szukane jest rozwi¹zanie
    % opis zwracanych wartoœci:
    %   x - wektor kolejnych przybli¿eñ rozwi¹zania
    %   y - wektor wartoœci funkcji kolejnych przybli¿eñ rozwi¹zania

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
