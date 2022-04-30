clear;
clc;

% codigo para Gauss - Seidel
% A = [3 -0.1 -0.2;0.1 7 -0.3;0.3 -0.2 10];
% b = [7.85;-19.3;71.4];

A = [8 3 1;1 5 3;3 1 5];
b = [12;9;9];

[n,m] = size(A);
x = zeros(1,m);
sol = zeros(2,m);
E = zeros(2,m);
Error_actual = 100;
Error_minimo = 0.00001;
k = 2;


for i = 1:n
    sum = 0;
    for j = 1:m
        if(i==j)
            continue
        else
            sum = sum + A(i,j);
            if(abs(A(i,i)) <= sum)
                disp("no es diagonal dominante")
                break
            end
        end
    end
end



while(Error_actual > Error_minimo)

    for i = 1:n % recorremos las filas desde la primera a la última.
        sum = 0;
        for j = 1:m
            if(j==i)
                continue
            else
                sum = sum + A(i,j)*x(j);
            end
        end
        x(i) = (b(i) - sum)/A(i,i);
        sol(k,i) = x(i);
    end
     
%     Estimación de mi error actual    
    for i = 1:m
        E(k,i) = abs((sol(k,i) - sol(k-1,i))/sol(k,i))*100;
    end
    
    Error_actual = max(E(k,:));
        
    k = k + 1;
    sol(k,:) = zeros(1,m);
    E(k,:) = zeros(1,m);
end

sol
x
E
