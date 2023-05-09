# problem 2, HW 5, ST590
# densities for F-ratios under null and alternative hypotheses:
#  
# H0: all 8 population treatment means equal
# H1: means are c(150,150,150,150, 150,170,200,250)
# N=24, n=3 per treatment, trt df=7, err df=16 
#
# set the error variance
sigma <- 40


# ff are points on the horizontal axis
ff <- seq(0,5,0.01) 

# yy are points on the vertical axis
yy <- df(ff,7,16)

# plot the usual F-density:
plot(ff,yy,type="l",main="F-ratios under H0,Ha",ylab="F density")  

# the alpha=.05 critical value, fstar
fstar <- qf(.95,7,16)

# color the area corresponding to a type I error
polygon(c(ff[ff>fstar],fstar),c(yy[ff>fstar],0),col="red")

# calculate the noncentrality parameter associated with Ha:
ncp <- 3*7*var(c(150,150,150,150,150,170,200,250))/sigma^2

# overlay the non-central F density on the existing graph
yy.ncp <- df(ff,7,16,ncp)
lines(ff,yy.ncp,type="l")

# color the area corresponding to a type II error
polygon(c(ff[ff<fstar],fstar),c(yy.ncp[ff<fstar],0),col="cadetblue1")

# add the line back in that got shaded over by the type II error
lines(ff,yy,type="l")

# add a legend
legend(3,.6,c("Type I error","Type II error"),fill=c("red","cadetblue1"))
