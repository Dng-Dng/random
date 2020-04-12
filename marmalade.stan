data {
int<lower=0> N;
real x[N];
}

parameters{ 
real mu; 
real<lower=0> sigmasquared; 
}

transformed parameters { real sigma; sigma = sqrt(sigmasquared);}

model {
for(i in 1:N)
    x[i] ~ normal(mu,sigma);
  mu ~ normal(425, 5);
  sigma ~ gamma(2,2);
}

