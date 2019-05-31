library(splines)

source("generate.data.R")
source("fitplm.R")

#generate simulated data
n<-400;  rho<-0.9; sig<-0.5; p<-2
set.seed(1000)
grid<-seq(0,1,length=100)
K<-floor(n^(1/9))
mydata<-generate.data1(n,p,rho,sig)
X<-mydata$X; Y<-mydata$Y; T<-mydata$T; truebeta<-mydata$truebeta
 

#fit the model
temp<-fitplm(Y,T,X,K)

#plot the estimated function with CI 
windows();
plot(temp$grid,temp$f,type="l",ylim=c(-1.5,1.5),lty=2); 
lines(temp$grid,temp$upper,col=2,lty=2);lines(temp$grid,temp$lower,col=2,lty=2);





  
