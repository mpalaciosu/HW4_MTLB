% QUESTION 4 :

function B = brownian_process6(mu, sigma, T, M)

dt = T(1, 2) - T(1, 1); 
dZ = zeros(M, length(T));
dB = zeros(M, length(T));
B = zeros(M, length(T));

% Generamos Wiener :
for i = 1:M
    for j = 2:length(T)
          dZ(i, j) = cauchy_random(0, dt);
          dB(i,j) = mu * dt + sigma * dZ(i,j);
          B(i,j) = B(i, j-1) + dB(i,j);
    end
end

return

