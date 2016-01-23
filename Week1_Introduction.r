library(UsingR)
library(dplyr)
data("father.son",package="UsingR")
head(father.son)
father.son["sheight"]
# 1
averageSonHeight <- select(father.son,sheight) %>% unlist
mean(averageSonHeight)
# 2
fatherHeight71 <- filter(father.son,round(fheight)==71) %>% select(sheight) %>% unlist %>% mean
fatherHeight71
