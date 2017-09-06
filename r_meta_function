#meta-analysis function

#author: Youngjun Na
#Email: ruminoreticulum@gmail.com
#Github: https://github.com/YoungjunNa
#Date: 9/6/2017

#example of dataset is available at https://github.com/YoungjunNa/animal_science/blob/master/meta_dataframe.xlsx

#read df
data<-readxl::read_excel("meta_dataframe.xlsx")

#function
numbers_meta<-function(data, treats, responses){
  #packages
  require(meta)
  require(dplyr)
  
  #data filtering
  meta1<-filter(data, treat==treats)
  meta2<-filter(meta1, response==responses)
  
  #meta-analysis
  meta3<-metacont(n1,m1,s1,n2,m2,s2, sm="SMD", study, data=meta2)
  forest(meta3, leftcols="studlab", digits=3)
  funnel(meta3)
}

group_by(data, treat) %>% summarize()
group_by(data, response) %>% summarize()

numbers_meta(data,"Sodium bicarbonate", "pH")
