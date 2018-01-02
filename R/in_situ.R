#Degradation parameters and Effective degradability

#author: Youngjun Na
#Email: ruminoreticulum@gmail.com
#Github: https://github.com/YoungjunNa
#Date: 9/25/2017

#Degradation parameter was made using the formula of Ørskov and McDonald (1979): P = a + b (1 - e^(-ct))
#where P: the actual degradation after time ‘t’; 
#a: the intercept of the degradation curve at time zero; 
#b: the potential degradability of the component of the protein which will, in time, be degraded; c: the rate constant for the degradation of ‘b’;
#t: time.

#The effective degradability (ED) of DM and CP was calculated using the following equation: ED = a + (b × c)/(c + k)
#where k was the estimated rate of outflow from the rumen and a, b, and c are the same parameters as described above.
#The ED was estimated as ED2, ED5, and ED8 assuming rumen solid outflow rates of 0.02, 0.05, and 0.08/h, which was representative for low, medium, and high feeding intake respectively (ARC, 1984).

#a, the fraction of dry matter and crude protein at initiation of incubation.
#b, the fraction of dry matter and crude protein insoluble but degradable in the rumen.
#c, the rate constant (h^(-1)) of disappearance of fraction b.
#ED, effective degradability at three ruminal passage rates (ie., 0.02, 0.05, and 0.08/h).

#REFERENCES
#ARC, 1984. The Nutrient Requirements of Ruminant Livestock, Suppl. No. 1. Agricultural Research Council, Commonwealth Agric. Bureau, Farnham Royal.
#Littell, R. C., P. R. Henry, and C. B. Ammerman. 1998. Statistical analysis of repeated measures data using SAS procedures. Journal of animal science. 76:1216-1231.
#Ørskov, E. R., and I. McDonald. 1979. The estimation of protein degradability in the rumen from incubation measurements weighted according to rate of passage. J. Agric. Sci. 92:499.


hour<-c(0,2,4,8,16,24,48)
DMD<-c(90,88,80,75,58,43,10)

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
  
  b<-exp(intercept)*100
  a<-100-b-df1$DMD[n]
  c<-(-x)
  ED2<-a+((b*c)/(c+0.02))
  ED5<-a+((b*c)/(c+0.05))
  ED8<-a+((b*c)/(c+0.08))
  
  result<-data.frame(Item=c("a","b","c","ED2","ED5","ED8"), Value=c(a,b,c,ED2,ED5,ED8))
  
  print(result) 
  
}

insitu(hour,DMD)
