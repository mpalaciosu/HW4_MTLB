%QUESTION 5 :
clear 
clc

run Q1.m

rng(1)
M = 5;
mu1 = 0.1;
sigma1 = 0.3;
mu2 = -0.2;
sigma2 = 0.1;
rho = 0.5;

dt = T(2);

dW1 = zeros(M, length(T));
dW2 = zeros(M, length(T));

dB1 = zeros(M, length(T));
dB2 = zeros(M, length(T));
B1 = zeros(M, length(T));
B2 = zeros(M, length(T));

% Calculo dW1 :
for i = 1:M
    for j = 2:length(T)
          dW1(i, j) = normrnd(0, dt);
          dW2(i, j) = normrnd(0, dt);
          dB1(i, j) = mu1*dt+sigma1*dW1(i,j);
          dB2(i, j)=mu2*dt+sigma2*(rho*dW1(i,j)+sqrt(1-rho^2)*dW2(i,j));
          B1(i, j) = B1(i, j-1) + dB1(i,j);
          B2(i, j) = B2(i, j-1) + dB2(i,j);
    end
end

figure(5)
hold on
for i = 1:M
    plot(B1(i,:));
end
title("Brownian Process 1")
xlabel("Week")
ylabel("Value")
grid on
hold off

figure(6)
hold on
for i = 1:M
    plot(B2(i,:));
end
title("Brownian Process 2")
xlabel("Week")
ylabel("Value")
grid on
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear 
clc

run Q1.m

rng(1)
M = 1000;
mu1 = 0.1;
sigma1 = 0.3;
mu2 = -0.2;
sigma2 = 0.1;
rho = 0.5;

dt = T(2);

dW1 = zeros(M, length(T));
dW2 = zeros(M, length(T));

dB1 = zeros(M, length(T));
dB2 = zeros(M, length(T));
B1 = zeros(M, length(T));
B2 = zeros(M, length(T));

% Calculo dW1 :
for i = 1:M
    for j = 2:length(T)
          dW1(i, j) = normrnd(0, dt);
          dW2(i, j) = normrnd(0, dt);
          dB1(i, j) = mu1*dt+sigma1*dW1(i,j);
          dB2(i, j)=mu2*dt+sigma2*(rho*dW1(i,j)+sqrt(1-rho^2)*dW2(i,j));
          B1(i, j) = B1(i, j-1) + dB1(i,j);
          B2(i, j) = B2(i, j-1) + dB2(i,j);

    end
end

lastB1 = B1(:,end);
lastB2 = B2(:,end);

dB1 = makedist("Normal", "mu",0.1, "sigma",0.0417);
dB2 = makedist("Normal", "mu", -0.2, "sigma", 0.0138);

figure(7)
hold on
histogram(lastB1, Normalization="pdf", NumBins=25)
plot(dB1, "PlotType","pdf")
title("Final Position B1")
xlabel("Position")
ylabel("Value")
grid on
hold off

figure(8)
hold on
histogram(lastB2, Normalization="pdf", NumBins=25)
plot(dB2, "PlotType","pdf")
title("Final Position B2")
xlabel("Position")
ylabel("Value")
grid on
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3 
clear 
clc

run Q1.m

rng(1)
M = 1000;
mu1 = 0.1;
sigma1 = 0.3;
mu2 = -0.2;
sigma2 = 0.1;
rho = linspace(-1, 1, 0.5);

dt = T(2);

dW1 = zeros(M, length(T));
dW2 = zeros(M, length(T));

dB1 = zeros(M, length(T));
dB2 = zeros(M, length(T));
B1 = zeros(M, length(T));
B2 = zeros(M, length(T));

% Calculo dW1 :
for k = 1:length(rho)
    for i = 1:M
        for j = 2:length(T)
            dW1(i, j) = normrnd(0, dt);
            dW2(i, j) = normrnd(0, dt);
            dB1(i, j) = mu1*dt+sigma1*dW1(i,j);
            dB2(i, j, k)=mu2*dt+sigma2*(rho(k)*dW1(i,j)+sqrt(1-rho(k)^2)*dW2(i,j));
            B1(i, j) = B1(i, j-1) + dB1(i,j);
            B2(i, j, k) = B2(i, j-1) + dB2(i,j, k);
        end
    end
end

% Me rindo, no se como seguir con esto...












