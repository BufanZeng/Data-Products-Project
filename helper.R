myfun<-function(contents,view,selected){
  udata<-contents[,c(3:10)]
  uprice<-contents[,c(11:15)]

  data<-udata+uprice[,3]
  b<-as.numeric(substr(view,nchar(view),nchar(view)))
  sop<-vector('numeric')
  for (i in 1:5){
    din<-data
    din[,b]<-data[,b]-uprice[,3]+uprice[,i]
    exped<-exp(din)
    exped[,-selected]=0
    proped<-prop.table(as.matrix(exped),margin=1)
    sop[i]<-mean(proped[,b])*100
  }
  return(sop)
}
myfun1<-function(price){
  p<-strsplit(price," ")
  p<-as.numeric(p)
  return(p)
}