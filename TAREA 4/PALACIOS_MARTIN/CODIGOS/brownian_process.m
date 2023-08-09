% QUESTION 4 :

function B = brownian_process(mu, sigma, T, M)

dT = T(1, 2) - T(1, 1); 
dW = zeros(M, length(T));
dB = zeros(M, length(T));
B = zeros(M, length(T));

% Generamos Wiener :
for i = 1:M
    for j = 2:length(T)
          dW(i,j) = normrnd(0, dT);
    end
end

% Generamos dBrownian :
for i = 1:M
    for j = 2:length(T)
        dB(i,j) = mu * dT + sigma * dW(i,j);
    end
end

% Generamos B Process :
for i = 1:M
    for j = 2:length(T)
        B(i,j) = B(i, j-1) + dB(i,j);
    end
end

return

