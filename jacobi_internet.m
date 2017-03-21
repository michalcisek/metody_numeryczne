n=3;

A= 5*diag(ones(n,1)) + (-1)*diag(ones(n-1,1),1) + (-1)*diag(ones(n-1,1),-1);
b=ones(n,1);
%[A,b,n]=matriz;
for i = 1 : n
	x0(i)= input('Type the initial value: ');
end
tolerance= input ('Type the Tolerance: ');
iterations = input('Type the Number of Iterations:');
counter = 0;
E = tolerance + 1;
while E > tolerance & counter < iterations
	for i = 1:n
		acum1=0;
		for p = 1 : i - 1
			acum1 = acum1 + A(i,p)*x0(p);
		endfor
		acum2=0;
		for q = i + 1: n
			acum2 = acum2 + A(i,q)*x0(q);
		endfor
		x1(i)= (b(i)-acum1 - acum2)/A(i,i);
	endfor
	E = max(abs(x1-x0));
	x0 = x1;
	counter = counter + 1;
	tabla(counter,1)= counter;
	for i = 1:n
		tabla(counter,i+1)= x0(i);
	endfor
	tabla(counter,n+2)= E;
endwhile
if E < tolerance
		disp(x0)
		fprintf(' is the solution whit an error of %g \n',E)
	else
		fprintf('The program failures in these iterations \n ')
endif
disp(tabla)



