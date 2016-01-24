# 1
nx <- 5
ny <-  7
X = cbind(rep(1,nx + ny),rep(c(0,1),c(nx, ny)))
(t(X) %*% X)[1,1]

# 2
(t(X) %*% X)