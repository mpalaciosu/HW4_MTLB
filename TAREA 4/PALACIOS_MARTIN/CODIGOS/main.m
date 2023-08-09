% LAUNCHER FOR HW 4 :

clear 
clc

rng(1)

% Q1 : 
run Q1.m

% Q2 : 
M = 5;
W = wiener_process(T, M);

% Graph :

figure(2)
hold on

for i = 1:M
    plot(W(i,:));
end 
title("Wiener Process")
xlabel("Week")
ylabel("Value")
grid on
hold off

% Q3 :
mu = 0.1;
sigma = 0.3;

B = brownian_process(mu, sigma, T, M);

% Graph :

figure(3)
hold on
for i = 1:M
    plot(B(i,:));
end
title("Brownian Process")
xlabel("Week")
ylabel("Value")
grid on
hold off

% Q4 : 
M = 1000;
B = brownian_process(mu, sigma, T, M);
pfB = B(:, 53);
% OBSERVACIÓN : El Valor de la varianza de la distribucion teorica viene de
%               una simulacion realizada con 100.000 datos y
%               posteriormente insertar la posicion final en: APPS ->
%               DISTRIBUTION FITTER -> insertar la data generada y hacer un
%               fitt a una distribucion normal (esta aplicacion interna de
%               MATLAB permite encontrar un mu y sigma para distribuciones
%               en base a datos a un 95% de confianza.
d = makedist("Normal", "mu", 0.1019, "sigma", 0.041615);

% plot
figure(4)
hold on
histogram(pfB, Normalization="pdf", NumBins=25)
plot(d, "PlotType","pdf")
title("Final Position Distribution")
xlabel("Position")
ylabel("Value")
grid on
hold off










