# Examples from book
set.seed(1)
g <- 9.8
n <- 25
tt <- seq(0,3.4,len=n)
d <- 56.67 - 0.5*g*tt^2 + rnorm(n,sd=1)

X <- cbind(1,tt,tt^2)
y <- d
betahat <- solve(crossprod(X)) %*% crossprod(X,y)
newtt <- seq(min(tt),max(tt),len=100)
X <- cbind(1,newtt,newtt^2)
fitted <- X %*% betahat
plot(tt,y,xlab = "Time", ylab = "Height")
lines(newtt,fitted,col=2)

library(UsingR)
x=father.son$fheight
y=father.son$sheight
X <- cbind(1,x)
betahat <- solve( t(X) %*% X ) %*% t(X) %*% y
###or
betahat <- solve( crossprod(X) ) %*% crossprod( X, y )

newx <- seq(min(x),max(x),len=100)
X <- cbind(1,newx)
fitted <- X %*% betahat
plot(x,y,xlab="Father's height",ylab="Son's height")
lines(newx,fitted,col=2)

# 1
X <- matrix(c(1,1,1,1,0,0,1,1),nrow=4)
rownames(X) <- c("a","a","b","b")
beta <- c(5, 2)
matrixa <- X[1:2,]
fitteda <- matrixa %*% beta
# 2
matrixb <- X[3:4,]
fittedb <- matrixb %*% beta
# 3
X <- matrix(c(1,1,1,1,1,1,0,0,1,1,0,0,0,0,0,0,1,1),nrow=6)
rownames(X) <- c("a","a","b","b","c","c")
beta <- c(10,3,-3)
X[3:4,] %*% beta
#4
X[5:6,] %*% beta
