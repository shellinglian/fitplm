Implementation accompanying the paper "Asymptotics of the Nonparametric Function for B-splines based Estimation in Partially Linear Models"

The R function fitplm() fit the spline-based partially linear model with the following inputs:
Y: n-vector of responses
T: n-vector of the variable for the nonparametric part. Make sure the support is inside [0,1]
K: number of internal knots for the splines. Suggested value is K=3 or 4, or [n^{1/9}]
alpha: 1-alpha is the confidence level of the pointwise CI for the nonparametric function that will be returned. alpha=0.05 is the default.
grid: a grid on [0,1] on which the function values as well as the 1-alpha confidence interval will be computed. Default value is provided

Returned values:

theta, beta: estimated coefficients of the PLM (see the paper for the notation)
covmattheta, covmatbeta: estimated asymptotic variance for theta and beta, respectively
grid: a grid on [0,1] on which the function values as well as the 1-alpha confidence interval are computed. 
f: estimated function value on the grid
upper, lower: upper/lower confidence bound on the grid for f