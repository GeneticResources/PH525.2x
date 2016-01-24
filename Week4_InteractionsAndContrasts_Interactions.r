#1
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/spider_wolff_gorb_2013.csv"
filename <- "spider_wolff_gorb_2013.csv"
library(downloader)
if (!file.exists(filename)) download(url, filename)
spider <- read.csv(filename, skip=1)
spider$log2friction <- log2(spider$friction)
boxplot(log2friction ~ type*leg, data=spider)
lmlog2friction <- lm(log2friction ~ type*leg, data=spider)
summary(lmlog2friction)

#2
anova(lmlog2friction)

#3
library(contrast)
contrast(lmlog2friction, list(type="pull",leg="L2"), list(type="pull",leg="L1"))
#or
coef(lmlog2friction)["legL2"]

#4
contrast(lmlog2friction, list(type="push",leg="L2"), list(type="push",leg="L1"))
#or
coef(lmlog2friction)["legL2"] + coef(lmlog2friction)["typepush:legL2"]

#5
set.seed(1)
generateF <- function(){
  N <- 40
  p <- 4
  group <- factor(rep(1:p,each=N/p))
  X <- model.matrix(~ group)
  Y <- rnorm(N,mean=42,7)
  mu0 <- mean(Y)
  initial.ss <- sum((Y - mu0)^2)
  s <- split(Y, group)
  after.group.ss <- sum(sapply(s, function(x) sum((x - mean(x))^2)))
  (group.ss <- initial.ss - after.group.ss)
  group.ms <- group.ss / (p - 1)
  after.group.ms <- after.group.ss / (N - p)
  f.value <- group.ms / after.group.ms
  return(f.value)
}
fvalues <- replicate(1000,generateF())
mean(fvalues)

# For fun
hist(fvalues, col="grey", border="white", breaks=50, freq=FALSE)
xs <- seq(from=0,to=6,length=100)
lines(xs, df(xs, df1 = p - 1, df2 = N - p), col="red")