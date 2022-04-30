A = [2 3 6;8 0 4;1 3 0]
b = [-1;3;2]

% A = [-3 4 2;1 -5 -7;10 3 6]
% b = [4;2;9]

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