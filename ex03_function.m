% Autor: Micha³ Bernardelli
% 2009.10.14
% Wprowadzenie do Octave: 
%   funkcje, instrukcje warunkowe, petle i pomiar czasu

% przyklady wywolania programu:
% wynik = ex03_function(10,1)
% ex03_function(-10,1)
% wynik = ex03_function(1000,10);

function y = ex03_function(m,n)  
    % m - rozmiar wektora
    % n - potega
    
    if ((m>0) && (n>0))
        fprintf("Parametry ok.\n");
    else
        fprintf("Zle parametry wywolania\n");
        y = -1;
        return;
    endif 
    
        % sposob 1
        % wlaczenie pomiaru czasu
    tic;
    y = zeros(m,1);
    for i=1:1:m
        y(i,1) = i^n;
    endfor
        % wylaczenie pomiaru czasu
    t = toc;
    fprintf("Czas wykonywania funkcji pierwszym sposobem: %f sek\n",t);

        % sposob 2
    tic;
    y = (1:m).^n;
    t = toc;
    fprintf("Czas wykonywania funkcji drugim sposobem: %f sek\n",t);
    
    i=1;
    % wypisanie pierwszych 10 elementow (jesli istnieja)
    while (i<=min(m,10))
        fprintf("element %d: %d\n",i,y(i));
        i++;
    endwhile
endfunction
