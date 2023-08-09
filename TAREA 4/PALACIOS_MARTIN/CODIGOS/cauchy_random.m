function x = cauchy_random(mu, sigma)
  % Generate a Cauchy random number with mean mu and standard deviation sigma.
  v = rand() * pi;
  x = mu + sigma * tan(v);
end


