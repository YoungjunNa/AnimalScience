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
DMD<-c(90,88,80,75,58,43,10)

insitu<-function(){
  
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
  
  b<-exp(intercept)*100
  a<-100-b-df1$DMD[n]
  c<-(-x)
  ED2<-a+((b*c)/(c+0.02))
  ED5<-a+((b*c)/(c+0.05))
  ED8<-a+((b*c)/(c+0.08))
  
  result<-data.frame(Item=c("a","b","c","ED2","ED5","ED8"), Value=c(a,b,c,ED2,ED5,ED8))
  
  print(result) 
  
}

insitu()
