% Question 6
rng(2)

%2
run Q1.m
M=5;

Wc = wiener_process6(T, M);

figure(1)
hold on

for i = 1:M
    plot(Wc(i,:));
end 
title("Wiener Process")
xlabel("Week")
ylabel("Value")
grid on
hold off



%3 
mu = 0.1;
sigma = 0.3;

Bc = brownian_process6(mu, sigma, T, M);
figure(2)
hold on
for i = 1:M
    plot(Bc(i,:));
end
title("Brownian Process")
xlabel("Week")
ylabel("Value")
grid on
hold off

%4
M = 100000;
mu = 0.1;
sigma = 0.3;

Bc = brownian_process6(mu, sigma, T, M);
Bcf = Bc(:, end);
d = makedist("tLocationScale","mu",mu, "sigma",sigma, "nu",1 );

figure(3)
hold on
histogram(Bcf, Normalization="pdf", NumBins=25)
plot(d, "PlotType","pdf")
title("Final Position Distribution")
xlabel("Position")
ylabel("Value")
grid on
hold off


