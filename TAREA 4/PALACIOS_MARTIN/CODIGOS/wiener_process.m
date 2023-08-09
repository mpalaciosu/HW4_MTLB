% QUESTION 2 :

function W = wiener_process(T, M)

dt = T(1, 2) - T(1, 1); 
dW = zeros(M, length(T));
W = zeros(M, length(T));

for i = 1:M
    for j = 2:length(T)
          dW(i, j) = normrnd(0, dt);
          W(i,j) = W(i, j-1) + dW(i, j);
    end
end

return 

