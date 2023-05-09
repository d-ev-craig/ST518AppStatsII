layout.mtx <- matrix(NA,nrow=6,ncol=6)
layout.mtx[1,] <- LETTERS[1:6]
layout.mtx[2,] <- LETTERS[1:6]

# Use modulo arithmetic to create an unrandomized latin
# square layout

for(i in 1:6){
layout.mtx[i,] <- LETTERS[1+(1:6+4+i)%%6]
}

set.seed(123)

#permute rows
layout.mtx <- layout.mtx[sample(6),]

#permute columns
layout.mtx <- layout.mtx[,sample(6)]

#permute labels:

nitrate <- as.factor(c("without","with"))
phosphate <- as.factor(c("none","single","double"))
label.mtx <- cbind(expand.grid(phosphate=phosphate,nitrate=nitrate),LETTERS[sample(6)])

print(layout.mtx) 
print(label.mtx)