#R code for meta-analysis

library(meta)
df<-readxl::read_excel("dataset.xls")

meta1<-metacont(n1,m1,s1,n2,m2,s2, sm="SMD", study, data=df) #effect size estimation

forest1<-forest(meta1, leftcols = "studlab", digits=3)  #forest plot

funnel(meta1) #funnel plot

metabias(meta1) #metabias test

meta5<-trimfill(meta, comb.fixed=TRUE)  #trim-and-fill analysis of funnel plot
funnel(meta5, comb.random=FALSE)
