#Degradation parameters and Effective degradability

#author: Youngjun Na
#Email: ruminoreticulum@gmail.com
#Github: https://github.com/YoungjunNa
#Date: 9/25/2017

## a, the fraction of dry matter and crude protein at initiation of incubation.
## b, the fraction of dry matter and crude protein insoluble but degradable in the rumen.
## c, the rate constant (h-1) of disappearance of fraction b.
## ED, effective degradability at three ruminal passage rates (ie., 0.02, 0.05, and 0.08/h).

hour<-c(0,2,4,8,16,24,48)
DMD<-c(95,93,88,75,58,43,10)

results<-data.frame(a=NA, b=NA, c=NA , ED2=NA, ED5=NA, ED8=NA)

insitu<-function(hour,DMD){
  
  require(dplyr)

  df<-data.frame(hour,DMD)
  n<-nrow(df)
  
  df1<-mutate(df, DMD_1=(DMD-DMD[n])/100)
  df2<-df1[-n,]
  df2<-mutate(df2, DMD_exp=(log(DMD_1,exp(1))))
  
  reg<-lm(df2$DMD_exp~df2$hour)
  reg<-reg$coefficients
  intercept<-reg[1]
  x<-reg[2]
  
  results[2]<-exp(intercept)*100
  results[1]<-100-results[2]-df1$DMD[n]
  results[3]<-(-x)
  results[4]<-results[1]+((results[2]*results[3])/(results[3]+0.02))
  results[5]<-results[1]+((results[2]*results[3])/(results[3]+0.05))
  results[6]<-results[1]+((results[2]*results[3])/(results[3]+0.08))
  
}

insitu(hour,DMD)
results
