read.table("heights-tall.txt")
heights.df <- read.table("heights-tall.txt")
head(heights.df)
heights.df <- read.table("heights-tall.txt",header=TRUE)
head(heights.df)
dim(heights.df)
names(heights.df)
is.data.frame(heights.df)
cov(heights.df)
cov(heights.df,cor=TRUE)
? cov
cor(heights.df)
colMeans(heights.df)
apply(heights.df,2,mean)
q()
2.4-1900*.0878
c(1,10,1900,10*1900) %*% c(3.4,2.4,1.085,-.0878)
c(1,11,1900,10*1900) %*% c(3.4,2.4,1.085,-.0878)
168.7-.0878*1900
c(1,10,1900,10*1900) %*% c(-2047,158.27,1.08545,-.0878)
c(1,10,1900,10*1900) %*% c(-2047,168.27,1.08545,-.0878)
c(1,11,1900,11*1900) %*% c(-2047,168.27,1.08545,-.0878)
c(1,11,1900,11*1900) %*% c(-2047,168.27,1.08545,-.0878) -29.855
168.27-.0878*1900
rvec <- rep(NA,100)
for(i in 1:100){
x <- rnorm(30,10,2)
}
for(i in 1:100){
x <- rnorm(30,10,2)
y <- 20 + (x-10)*sqrt(4/2)*0.6
rvec[i] <- cor(x,y)
}
rvec
for(i in 1:100){
x <- rnorm(30,10,2)
y <- 20 + 0.6*(x-10)/sqrt(2) + rnorm(30,0,4)
rvec[i] <- cor(x,y)}
rvec
hist(rvec)
for(i in 1:100){x <- rnorm(30,10,2)
y <- 20 + 0.6*(x-10)/sqrt(2) + rnorm(30,0,4*(1-.6^2))
rvec[i] <- cor(x,y)}
hist(rvec)
mean(rvec)
for(i in 1:100){x <- rnorm(30,10,2)
y <- 20 + 0.6*(x-10)*sqrt(4/2) + rnorm(30,0,4*(1-.6^2))
rvec[i] <- cor(x,y)}
mean(rvec)
hist(rvec)
? rnorm
mean(rvec)
hist(rvec)
source("corr-sim.r")
hist(rvec)
mean(rvec)
t.test(rvec)
source("corr-sim.r")
mean(rvec)
mean(rvec>.7)
x
mean(x)
rvec
z <- sqrt(30-3)*0.5*(log((1+rvec)/(1-rvec))-log((1+0.6)/(1-.6)))
z
hist(z)
source("corr-sim.r")
z <- sqrt(30-3)*0.5*(log((1+rvec)/(1-rvec))-log((1+0.6)/(1-.6)))
hist(z)
mean(rvec>.7)
sqrt(.2*.8/1000)
mean(rvec)
sqrt(30-3)*0.5*(log((1+.7)/(1-.7))-log((1+0.6)/(1-.6)))
pnorm(sqrt(30-3)*0.5*(log((1+.7)/(1-.7))-log((1+0.6)/(1-.6))))
1-pnorm(sqrt(30-3)*0.5*(log((1+.7)/(1-.7))-log((1+0.6)/(1-.6))))
1-pnorm(sqrt(40-3)*0.5*(log((1+.7)/(1-.7))-log((1+0.6)/(1-.6))))
1-pnorm(sqrt(50-3)*0.5*(log((1+.7)/(1-.7))-log((1+0.6)/(1-.6))))
quantile(0.7,rvec)
quantile(rvec,0.7)
qqnorm(rvec)
qqnorm(log((1+rvec)/(1-rvec)))
1-pnorm(sqrt(30-3)*0.5*(log((1+.7)/(1-.7))-log((1+0.6)/(1-.6))))
sqrt(30-3)*0.5*(log((1+.7)/(1-.7))-log((1+0.6)/(1-.6)))
mvnorm
library(MASS)
mvnorm
rmvnorm
Sigma
Sigma <- matrix(c(1,0.6,0.6,1),nrow=2)
Sigma
mvrnorm(5,c(0,0),Sigma)
tmp <- mvrnorm(5,c(0,0),Sigma)
cor(tmp)
source("corr-sim.r")
source("corr-sim.r")
mean(rvec)
mean(rvec>.7)
length(rvec>.7)
prop.test(rvec>.7)
prop.test(sum(rvec>.7),1000)dd
source("corr-sim.r")
prop.test(sum(rvec>.7),1000)
paste0
q()
xpx
xpx <- matrix(c(4,3,0,3,5,0,0,0,10),byrow=T,nrow=3)
xpx
solve(xpx)
q()
trees
with(trees,
lm(Volume~Height+Height*Height+Girth))
with(trees,
lm(Volume~Height+Height^2+Girth))
lm(Volume~Height+Height+Girth))
with(trees,
lm(Volume~Height+Height+Girth))
is.data.frame(trees)
(trees)
is.factor(trees$Height)
height2 <- trees$Height^2
lm(trees$Volume~trees$Height+trees$Girth+height2)
anova(lm(trees$Volume~trees$Height+trees$Girth+height2))
anova(lm(trees$Volume~trees$Height+trees$Girth))
coef(lm(trees$Volume~trees$Height+trees$Girth))
lm.out <- lm(trees$Volume~trees$Height+trees$Girth)
partial(lm.out)
? pcor.test
? cor
install.packages("pcor")
source("pcor.R")
pcor.test(trees$Girth,trees$Height,trees$Volume)
pcor.test(trees$Volume,trees$Girth,trees$Height)
pcor.test(trees$Volume,trees$Height,trees$Girth)
coef(lm.out)
sqrt(c(.91894,.19527))
q()
pcor.test(trees$Volume,trees$Girth,trees$Height)
pcor.test(trees$Girth,trees$Volume,trees$Height)
pcor.test
pcor.test(trees$Girth,trees$Volume,trees$Height)
pcor.test
pcor.test(trees$Height,trees$Volume,trees$Girth)
pcor.test(trees$Girth,trees$Volume,trees$Height)
q()
mtcars.fit1 <- lm(mtcars$mpg ~ mtcars$wt+mtcars$qsec+mtcars$am)
plot(resid(mtcars.fit1),mtcars$disp)
cor(mtcars$disp,resid(mtcars.fit1),mtcars$disp)
cor(mtcars$disp,resid(mtcars.fit1))
mtcars.fit2 <- lm(mtcars$mpg ~ mtcars$cyl+mtcars$hp+mtcars$wt)
cor(mtcars$disp,resid(mtcars.fit2))
q()
993/1126
sqrt(993/1126)
62.3/sqrt(5.8*1639)
110.3/(4.2*32)
224.6+.83*32/4.2
230.9+1.96*sqrt(1)
.82^2
.82^2 * 29623
(1-.82^2) * 29623
(1-.82^2) * 29623/28
sqrt((1-.82^2) * 29623/28)
230.9+1.96*sqrt(346.6)
with(trees,
trees.out1 <- lm(Volume ~ Girth + Height))
trees.out1
trees
attach(trees)
trees.out1 <- lm(Volume ~ Girth + Height)
trees.out1 <- lm(Volume ~ Girth + Height + Girth*Height)
trees.out1 <- lm(Volume ~ Girth + Height)
trees.out2 <- lm(Volume ~ Girth + Height + Girth*Height)
anova(trees.out1)
anova(trees.out2)
q()
attach(trees)
trees.model1 <- lm(Volume~Girth+Height)
coef(trees.model1)
vcov(trees.model1)
Sigmahat <- vcov(trees.model1)
(c(1,15,80) %*% Sigmahat) %*% c(1,15,80)
sqrt((c(1,15,80) %*% Sigmahat) %*% c(1,15,80))
savehistory("Sarah.Rhistory")
q()
source("DBhiddenf.r")
source("DBhiddenf.r")
DB.df
rm(DBdf)
DB.df
source("DBhiddenf.r")
DB.df
library(HiddenF)
library(hiddenf)
DB.out <- hiddenf(DBmtx)
DB.out <- HiddenF(DBmtx)
DBmtx <- matrix(DB.df[,2:4])
DB.out <- HiddenF(DBmtx)
DBmtx
DBmtx <- as.matrix(DB.df[,2:4])
DBmtx
DB.out <- HiddenF(DBmtx)
plot(DB.out)
source("DBhiddenf.r")
source("DBhiddenf.r")
anova(DB.out)
summary(DB.out)
2^14
2^14-1
plot(DB.out,color=c("black","black")
)
plot(DB.out,color=c("black","black"),main="Interaction plot for spider mortaliities")
dev.copy2pdf(file="DBiplot0.pdf")
15+4/60
15+3/60
(15+3/60)/5
5/(15+3/60)
5/((15+3/60)/60)
5/((15+2/60)/60)
q()
qt(.975,9)
qchisq(c(.025,.975),20)
2.24*d
dfhat <- 10:30
2.24*dfhat/qchisq(.975,dfhat)
dfhat <- 5:30
dfhat <- 1:10
2.24*dfhat/qchisq(.975,dfhat)
2.243*dfhat/qchisq(.975,dfhat)
dfhat <- seq(2,3,by=.1)
2.243*dfhat/qchisq(.975,dfhat)
2.243*2.4/qchisq(.975,2.4)
qchisq(c(.025,.975),2.4)
sqrt(2.24+5.7)/39.09
2.24/(2.24+5.7)
2.10/(2.10+2.1+1.94)
2.10/(2.10+1.94)
mean(c(2.21,2.03,2.17,1.92))
sqrt(2*.089/8)
sqrt(2*.015/8)
q()
I
? I
y <- rbinom(10,p=.5,n=sample(10))dd
n <- round(runif(10,5,15) )
n
y <- rbinom(10,0.5,n=n)
y
cbind(y,n)
y/n
I(y/n)
? glm
glm(y/n~1:10,family="binomial")
? glm
x <- 1:10
glm(y/n~x,family="binomial")
I(y/n)
glm(I(y/n)~x,family="binomial")
glm(y/n~x,family="binomial")
fit1 <- glm(y/n~x,family="binomial")
fit2 <- glm(I(y/n)~x,family="binomial")
coef(fit1)
coef(fit2)
fit2 <- glm(cbind(y,n-y)~x,family="binomial")
fit2 
coef(fit2) 
coef(fit1) 
fit2 <- glm(cbind(y,n)~x,family="binomial")
coef(fit1) 
coef(fit2) 
? glm
q()
mtcars
? mtcars
mtcars %>% head
mtcars %>% pairs
library(leaps)
regsubsets.out <- regsubsets(mpg ~ .,data=mtcars)
names(regsubsets.out) 
dim(regsubsets.out) 
? regsubsets.out 
? regsubsets
regsubsets.out <- regsubsets(mpg ~ .,data=mtcars,method="exhaustive")
regsubsets.out$np 
names(regsubsets.out)
? regsubsets
summary(regsubsets.out)
? regsubsets
regsubsets.out <- regsubsets(mpg ~ .,data=mtcars,method="exhaustive",nvmax=10,nbest=10)
summary(regsubsets.out) 
regsubsets.out <- regsubsets(mpg ~ .,data=mtcars,method="exhaustive",nvmax=10,nbest=20)
summary(regsubsets.out) 
? regsubsets
res.legend <- subsets(regsubsets.out,statistic="cp")
? leaps
leaps(y=mpg, x=.,data=mtcars,method="Cp")
? leaps
? leaps
attach(mtcars)
leaps(y=mpg, x=.,method="Cp",nbest=10)
names(mtcars)
? leaps
mtcars[1:2,]
#leaps(y=mpg, x=mtcars[,3:12],method="Cp",nbest=10)
dim(mtcars)
leaps(y=mpg, x=mtcars[,3:11],method="Cp",nbest=10)
leaps.out <- leaps(y=mpg, x=mtcars[,2:11],method="Cp",nbest=10)
names(leaps.out) 
leaps.out$which
leaps.out$cp
names(leaps.out) 
leaps.out$Cp
order.cp <- order(leaps.out$Cp)
leaps.out[,order.cp] %>% head
leaps.out[order.cp,] %>% head
leaps.out[order.cp,] 
typeof(leaps.out)
summary(leaps.out)
leaps.out$label[1:10]
leaps.out$label[1:20]
leaps.out$label
leaps.out$Cp
which.min(leaps.out$Cp)
names(leaps.out)
dim(leaps.out$which)
leaps.out$which[21]
leaps.out$which[21,]
names(leaps.out)
leaps.out$which[21,][leaps.out$label]
names(mtcars)
leaps.out$which[21,]
names(mtcars)[2:10][leaps.out$which[21,]]
getwd()
savehistory("mtcars.Rhistory")
getwd()
q()
c(7.5,7.2,6.7))
var(c(7.5,7.2,6.7))
mean(c(7.5,7.2,6.7))
mean(c(7.5,7.3,6.7))
mean(c(7.5,7.3,6.7))*7
mean(c(7.5,7.3,6.7))
var(c(7.5,7.3,6.7)) - mean(c(7.5,7.3,6.7))
c(7.5,7.3,6.7) - mean(c(7.5,7.3,6.7))
(c(7.5,7.3,6.7) - mean(c(7.5,7.3,6.7)))^2
sum((c(7.5,7.3,6.7) - mean(c(7.5,7.3,6.7)))^2)
sum((c(7.5,7.3,6.7) - mean(c(7.5,7.3,6.7)))^2)/2
c(7.5,7.3,6.7) - mean(c(7.5,7.3,6.7))
(c(7.5,7.3,6.7) - mean(c(7.5,7.3,6.7)))^2
sum((c(7.5,7.3,6.7) - mean(c(7.5,7.3,6.7)))^2)
var(c(7.5,7.3,6.7))
var(c(7.5,7.3,6.7))
sum((c(7.5,7.3,6.7) - mean(c(7.5,7.3,6.7)))^2)/2
7*(sum((c(7.5,7.3,6.7) - mean(c(7.5,7.3,6.7)))^2)/2)
mean(c(.6,.7,.4)^2)
(c(.6,.7,.4)^2)
mean(c(.6,.7,.4)^2)
mean(c(.6,.7,.4)^2)*18
1.21/.34
qf(.95,2,18)
1-pf(1.21/.34,2,18)
24/85
sqrt(24/85)
2.4/8.48
var(c(7.5,7.3,6.7))
(c(7.5,7.3,6.7))
var(c(7.5,7.3,6.7))
7*var(c(7.5,7.3,6.7))
savehistory("oh-sept16.Rhistory")
