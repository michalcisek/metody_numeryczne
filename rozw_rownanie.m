% Autor: Micha� Bernardelli
% 2012.11.08
%   Por�wnanie metod rozwi�zywania uk�ad�w r�wna�

clear;

    % nadanie wartosci parametrom
n = [3,5,8,10,15,20,25,30];
alfa = 3;

    % tablice do zapamietania czasow dzialania
time1 = zeros(size(n));
time2 = zeros(size(n));
time3 = zeros(size(n));

    % tablice do zapamietania uwarunkowania w normie 2
cond2 = zeros(size(n));

    % tablice do zapamietania drugiej normy residuum
res1 = zeros(size(n));
res2 = zeros(size(n));
res3 = zeros(size(n));

for i=1:max(size(n))
        % tworzenie macierzy i wektora - odkomentowa� odpowiedni� lini�
    %A = hilb(n(i));
    A = ones(n(i),n(i))./n(i) + (alfa-1./n(i))*eye(n(i));
    %A = diag(2*ones(n(i),1),0) + diag(-1*ones(n(i)-1,1),1) + diag(-1*ones(n(i)-1,1),-1);
    cond2(i) = cond(A,2);
    b = ones(n(i),1);
    
    tic();
    x = inv(A)*b;
    time1(i) = toc();
    res1(i) = norm(b-A*x,2);

    tic();
    [L,U,P] = lu(A);
    x = U\(L\(P*b));
    time2(i) = toc();
    res2(i) = norm(b-A*x,2);
    
    tic();
    x = A\b;
    time3(i) = toc();
    res3(i) = norm(b-A*x,2);
endfor


printf("\nBLEDY\n");
printf("Metoda\t Wartosc \n");
printf("inv \t %15e \n",res1(max(size(n))));
printf("LU \t %15e \n",res2(max(size(n))));
printf("\\ \t %15e \n",res3(max(size(n))));

printf("\nCZASY\n");
printf("Metoda\t Wartosc \n");
printf("inv \t %15e \n",time1(max(size(n))));
printf("LU \t %15e \n",time2(max(size(n))));
printf("\\ \t %15e \n",time3(max(size(n))));

    % rysowanie wynikow:
    %   czerwony - inv
    %   niebieski - LU
    %   zolty - \
    
subplot(3,1,1);
plot(n,time1,'r',n,time2,'b',n,time3,'y');
legend('inv', 'LU', '\');
title('Czas rozwiazywania ukladu rownan');

subplot(3,1,2);
plot(n,cond2);
title('Uwarunkowanie w normie drugiej');

    % druga norma residuum
subplot(3,1,3);
plot(n,res1,'r',n,res2,'b',n,res3,'y');
title('Druga norma residuum');