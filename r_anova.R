#Analysis of variance

library(lsmeans)

#CRD ANOVA
treat <- c(rep("treatA",5), rep("treatB",5), rep("treatC",5), rep("treatD",5))
DMI <- c(42,45,41,56,47, 47,54,46,52,49, 55,52,57,49,45, 51,44,47,50,54)
mydata <- data.frame(treat, DMI)

myfit <- lm(DMI ~ treat, mydata)
anova(myfit) #ANOVA
summary(myfit)
lsmeans(myfit, "treat") #lsmenas


#RCBD ANOVA
treat <- c(rep("treatA",5), rep("treatB",5), rep("treatC",5), rep("treatD",5))
block <- c(rep("block1",2), rep("block2",3))
DMI <- c(42,45,41,56,47, 47,54,46,52,49, 55,52,57,49,45, 51,44,47,50,54)
mydata <- data.frame(treat, block, DMI)

myfit <- lm(DMI ~ treat+block, mydata)
anova(myfit) #ANOVA

summary(myfit)
lsm<-lsmeans(myfit, "treat") #lsmenas
pairs(lsm) #pdiff

#LSD ANOVA
treat <- c(rep("treatA",5), rep("treatB",5), rep("treatC",5), rep("treatD",5), rep("treatE",5))
period <- c(rep("period1",1), rep("period2",1), rep("period3",1), rep("period4",1), rep("period5",1))
animal <- c("A","E","C","B","D", "C","B","A","D","E", "B","C","D","E","A", "D","A","E","C","B", "E","D","B","A","C")
DMI <- c(42,45,41,56,47, 47,54,46,52,49, 55,52,57,49,45, 51,44,47,50,54, 44,50,48,43,46)
mydata <- data.frame(treat, period, animal, DMI) #5x5 LSD

matrix(mydata$period, 5,5)
matrix(mydata$animal, 5,5)

myfit <- lm(DMI ~ treat+period+animal, mydata)
anova(myfit) #ANOVA

summary(myfit)
lsmeans(myfit, "treat") #lsmenas
