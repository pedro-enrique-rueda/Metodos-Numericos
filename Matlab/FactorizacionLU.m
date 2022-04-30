clear;
clc;

%A = [2 3 6;8 0 4;1 3 0]
%b = [-1;3;2]

% A = [-3 4 2;1 -5 -7;10 3 6]
% b = [4;2;9]

A = [2 3 5;1 1 3;3 2 3]
b = [10;5;8]

[n,m] = size(A);

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

% fase de descomposicion / reduccion de gauss con algunos cambios
for k = 1:n-1
    for i = k+1:n
        factor = A(i,k) / A(k,k);
        A(i,k) = factor;
        for j = k+1:n
            A(i,j) = A(i,j) - factor * A(k,j);
        end
    end
end
A
% fase de substitucion 
%     forward substitution / algoritmo de descenso
for i = 2:n
    sum = b(i);
    for j = 1:i-1
        sum = sum - A(i,j)*b(j);
    end 
    b(i) = sum;
end
%     backward substitution / algoritmo de remonte

x(n) = b(n) / A(n,n);
for i = n-1:-1:1
    for j = i+1:n
        x(i) = x(i) - A(i,j)*x(j); 
    end
    x(i) = x(i) + b(i);
    x(i) = x(i) / A(i,i);
end
x
