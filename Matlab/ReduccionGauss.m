clear

A = [2 3 6;
    8 0 4;
    1 3 0]
b = [-1;
    3;
    2]
  
[m,n] = size(A);

tic;

% pivote
for k = 1:n
    if(A(k,k)==0)
        for i = 1:n
            if(A(i,k) ~= 0)
                for j = 1:n
                     cambioA = A(k,j);
                     A(k,j) = A(i,j);
                     A(i,j) = cambioA;                 
                end
                cambiob = b(k);
                b(k) = b(i);
                b(i) = cambiob;          
                
            end
        end
    end
    
end

A
b

% Operando Matriz A

  
  for k = 1:1:n-1     
    for i = (1+k):n
      for j = k:n
        em = A(i,k)/A(k,k);   
        A(i,j) = A(i,j) - A(k,j)*em;
      end
    end
  end
A
  % Operando Matriz b
  for k = 1:n-1
    for i = 1+k:n    
      b(i) = b(i) - A(i,k).*(b(k)/A(k,k));
    end
  end

%  Algoritmo de Remonte

  x(n) = b(m)/A(m,n);
  for i = m-1:-1:1
    for j = i+1:n
      x(i) = x(i)-A(i,j)*x(j);
    end
    x(i)=x(i)+b(i);
    x(i)=x(i)/A(i,i);
  end
  time = toc;
x

