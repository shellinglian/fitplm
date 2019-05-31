library(mvtnorm)

generate.data1<-function(n,p=2,rho=0.3,sig=0.5){


f<-function(x){
  exp(-32*(x-0.5)^2)+2*x-1
}



  S<-outer(1:(p+1),1:(p+1),'-')
  S<-exp(log(rho)*abs(S))
  X<-rmvnorm(n,mean=rep(0,p+1),sigma=S)
  T<-pnorm(X[,1])
  X<-X[,2:(p+1)]

  beta<-rep(c(1,-1),p/2)
  
  noise<-rnorm(n,sd=sig)
  Y<-f(T)+X%*%beta+noise

  truefgrid<-f(grid)
  truef<-f(T)
  return(list(X=X,Y=as.vector(Y),T=T,truebeta=beta,
		  truef=truef,truefgrid=truefgrid		  ))
}














