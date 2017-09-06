#meta-analysis macro

#author: Youngjun Na
#Email: ruminoreticulum@gmail.com
#Github: https://github.com/YoungjunNa
#Date: 9/6/2017

#example of dataset is available at https://github.com/YoungjunNa/animal_science/blob/master/meta_dataframe.xlsx

#packages
library(meta)
library(dplyr)

#read df
df<-readxl::read_excel("meta_dataframe.xlsx")

#filtering the data
treat<-group_by(df, treat) %>% summarise() #grouping the treatment
n<-nrow(treat) 

#for loop
for(i in 0:(n-1)){
  i=i+1
  trt<-treat[i,1]
  meta<-filter(df, treat==paste(trt[1,1])) 
  
  response<-group_by(meta, response) %>% summarise() #grouping the response
  m<-nrow(response)
  
  for(j in 0:(m-1)){
    j=j+1
    resp<-response[j,1]
    
    meta1<-filter(meta, response==paste(resp[1,1]))
    meta2<-metacont(n1,m1,s1,n2,m2,s2, sm="SMD", study, data=meta1)
    
    forest(meta2, leftcols="studlab", digits=3)
    funnel(meta2)
  }
}
