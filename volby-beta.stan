data {
  int N;
  vector<lower=0,upper=1>[N] prediction;
  vector<lower=0,upper=1>[N] actual;
  real precision_prior_mean;
  real precision_prior_sd;
  int<lower=0,upper=1> prior_only;
}

parameters {
  real<lower=0> precision;
}

model {
  precision ~ lognormal(precision_prior_mean, precision_prior_sd);
  if(prior_only == 0) {
    actual ~ beta(precision * prediction, precision * (1 - prediction));
  }
}
