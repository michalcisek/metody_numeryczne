function [] = raport(n, order)
  
  czasy_iter = zeros(n-9, 1);
  czasy_pcg = zeros(n-9, 1);
  
  normy_iter = zeros(n-9, 1);
  normy_pcg = zeros(n-9, 1);
  
  for i = 10:1:n
    A = (-1)*diag(ones(i-2, 1), -2) + (-1)*diag(ones(i-1, 1), -1) + 4*eye(i) + (-1)*diag(ones(i-1, 1), 1) + (-1)*diag(ones(i-2, 1), 2);
    b = 2*ones(i,1);

    tic;
    y = iteruj(A, b, order);
    czasy_iter(i-9, 1) = toc;
    normy_iter(i-9, 1) = norm(b-A*y);
    
    
    tic;
    y = pcg(A, b);
    czasy_pcg(i-9, 1) = toc;
    normy_pcg(i-9, 1) = norm(b-A*y);
  endfor
  
  %wykres czasow rozwiazania
  x_axis = 10:1:n;
  plot(x_axis, czasy_iter, "r", x_axis, czasy_pcg, "b");
  legend("iteruj()", "CG");  
  print -djpg wykres_czas.jpg;
 
 
  %wykres norm residuum
  x_axis = 10:1:n;
  plot(x_axis, normy_iter, "--r", x_axis, normy_pcg, "--b");
  legend("iteruj()", "CG");
  print -djpg wykres_dokladnosc.jpg

  %wyswietlenie podsumowania
  czasy_pods = [x_axis; czasy_iter'; czasy_pcg'];
  disp("\n \n");
  disp("Porownanie czasow dzialania: \n");
  disp("k  |  iteruj    |    cg");
  disp("______________________________");
  fprintf('%i | %6.8f | %6.8f \n' , czasy_pods);

  normy_pods = [x_axis; normy_iter'; normy_pcg'];
  disp("\n \n");
  disp("Porownanie norm residuum: \n");
  disp("k  |  iteruj    |    cg");
  disp("______________________________");
  fprintf('%i | %6.8f | %6.8f \n' , normy_pods);
  
endfunction