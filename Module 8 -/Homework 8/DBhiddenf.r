library(hiddenf)

# read in data
DB.df <- read.csv("DBdat.mtx",header=TRUE,sep=",",skip=1)
# format data as matrix with treatments as columns,
# blocks as rows
DBmtx <- as.matrix(DB.df[,2:4])

# apply the HiddenF function to obtain an object of class "HiddenF"
DB.out <- HiddenF(DBmtx)

# the rest is output:
anova(DB.out) 
summary(DB.out) 
plot(DB.out,color=c("black","black"),main="Interaction plot for spider mortaliities")
dev.copy2pdf(file="DBiplot0.pdf")
plot(DB.out,lwd=2,main="Interaction Plot for spider mortality")
dev.copy2pdf(file="DBiplot1.pdf")
