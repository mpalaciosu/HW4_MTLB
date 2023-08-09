function W = wiener_process6(T, M)

dt = T(1, 2) - T(1, 1); 
dZ = zeros(M, length(T));
W = zeros(M, length(T));



for i = 1:M
    for j = 2:length(T)
          dZ(i, j) = cauchy_random(0, dt);
          W(i,j) = W(i, j-1) + dZ(i, j);
    end
end

return 

