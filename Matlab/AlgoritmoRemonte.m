clear;

A = [1 2 3;
    0 4 5;
    0 0 6];
b = [11;
    22;
    33];
  
[m,n] = size(A);


%  Algoritmo de Remonte

  x(n) = b(m)/A(m,n);
  for i = m-1:-1:1
    for j = i+1:n
      x(i) = x(i)-A(i,j)*x(j);
    end
    x(i)=x(i)+b(i);
    x(i)=x(i)/A(i,i);
  end
  x