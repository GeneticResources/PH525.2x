# 1
matrix(1:60,20,3)
matrix(1:60,20,3,byrow=TRUE) #answer
x=11:20;rbind(x,2*x,3*x)
x=1:40;matrix(3*x,20,2)
# 2
x <- matrix(c(3,2,1,5,4,2,-1,0,-5,2,5,0,1,-1,-5,1),4,4)
y <- matrix(c(10,5,7,4),4,1)
solve(x)%*%y
# 3
a <- matrix(1:12, nrow=4)
b <- matrix(1:15, nrow=3)
(a %*% b)[3,2]
# 4
a[3,] %*% b[,2]