#1
m = matrix(c(1,1,1,1,0,0,1,1,0,1,0,1,0,0,0,1),4,4)
qr(m)$rank == ncol(m)

#2
sex <- factor(rep(c("female","male"),each=4))
trt <- factor(c("A","A","B","B","C","C","D","D"))
X <- model.matrix( ~ sex + trt)
qr(X)$rank

Y <- 1:8
makeYstar <- function(a,b) Y - X[,2] * a - X[,5] * b
fitTheRest <- function(a,b) {
  Ystar <- makeYstar(a,b)
  Xrest <- X[,-c(2,5)]
  betarest <- solve(t(Xrest) %*% Xrest) %*% t(Xrest) %*% Ystar
  residuals <- Ystar - Xrest %*% betarest
  sum(residuals^2)
}
fitTheRest(1,2)

#3
expand.grid(1:3,1:3)
outer(1:3,1:3,'*')
betas = expand.grid(-2:8,-2:8)
rss = apply(betas,1,function(x) fitTheRest(x[1],x[2]))
## Note that all pairs add to 6
themin= min(rss)
betas[which(rss==themin),]

#Extra
library(rafalib)
## plot the pairs what are minimum
themin=min(rss)
plot(betas[which(rss==themin),])