# 1
library(contrast)
species <- factor(c("A","A","B","B"))
condition <- factor(c("control","treated","control","treated"))
model.matrix(~ species + condition)
# Logically: (0,1,0) - (0,0,1)
# In code:
y = rnorm(4)
fitSC = lm(y ~ species + condition)
contrast(fitSC, list(species="B",condition="control"), list(species="A",condition="treated"))$X

# 2
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/spider_wolff_gorb_2013.csv"
filename <- "spider_wolff_gorb_2013.csv"
library(downloader)
if (!file.exists(filename)) download(url, filename)
spider <- read.csv(filename, skip=1)
fitspider <- lm(friction~type+leg, data=spider)
L4vsL2 <- contrast(fitspider, list(leg="L4",type="pull"), list(leg="L2",type="pull"))

# 3
X <- model.matrix(~ type + leg, data=spider)
(Sigma <- sum(fitspider$residuals^2)/(nrow(X) - ncol(X)) * solve(t(X) %*% X))
C <- matrix(c(0,0,-1,0,1),1,5)
Sigma[3,5]