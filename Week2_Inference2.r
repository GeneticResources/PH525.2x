# 1
library(UsingR)
x = father.son$fheight
y = father.son$sheight
n = length(y)
N = 50

set.seed(1)
index = sample(n,N)
sampledat = father.son[index,]
x = sampledat$fheight
y = sampledat$sheight
betahat = lm(y~x)$coef
fit = lm(y~x)
fit$fitted.values
residualsOne <- (y - fit$fitted.values)^2
ssr <-  sum(residualsOne)

# 2
sigma2 <- ssr/48
X = cbind(rep(1,N), x)
resultTwo <- solve(t(X) %*% X)

# 3
sqrt(diag(resultTwo) * sigma2)[2]
