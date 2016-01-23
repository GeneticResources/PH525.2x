# 1
g = 9.8 ## meters per second
h0 = 56.67
v0 = 0
n = 25
tt = seq(0,3.4,len=n) ##time in secs, t is a base function
y = h0 + v0 *tt - 0.5* g*tt^2 + rnorm(n,sd=1)

# y = b0 + b1*tt + b2*tt^2 + e
# g = -2b2

X = cbind(1,tt,tt^2)
A = solve(crossprod(X))%*%t(X)
-2*(A %*% y)[3]
# The A%*%y gives us the LSE for all three coefficients.
# The third entry gives us the coefficient for the quantradic term which is -0.5 * g.
# We multiply by -2 to get the estimate of g.

# 2
set.seed(1)
mc <- function() {
  y <- h0 + v0 *tt - 0.5* g*tt^2 + rnorm(n,sd=1)
  X <- cbind(1,tt,tt^2)
  A <- solve(crossprod(X))%*%t(X)
  testResult <- -2*(A %*% y)[3]
  return(testResult)
}
repResultTwo <- replicate(100000,mc())
sd(repResultTwo)

# 3
library(UsingR)
x = father.son$fheight
y = father.son$sheight
n = length(y)

mcThree <- function(){
  N = 50
  index = sample(n,N)
  sampledat = father.son[index,]
  x = sampledat$fheight
  y = sampledat$sheight
  betahat =  lm(y~x)$coef
  betahatx <- betahat["x"]
  return(betahatx)
}
set.seed(1)
repResultThree <- replicate(10000,mcThree())
sd(repResultThree)

# 4
x = father.son$fheight
y = father.son$sheight
covResult <- mean((y-mean(y)) * (x-mean(x)))