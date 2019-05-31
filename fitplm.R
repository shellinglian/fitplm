fitplm<-function(Y,T,X,K,alpha=0.05,grid=seq(0,1,length=100)){

n<-length(Y)

#construct the spline basis
Z<-splineDesign(knots=c(0,0,0,seq(0,1,length=K+2),1,1,1),x=as.vector(T))
V<-cbind(Z,X)
p<-dim(V)[2]

b<-as.vector( solve(t(V)%*%V,t(V)%*%Y) )
beta=b[-(1:(K+4))];theta=b[1:(K+4)]

#use residuals to estimate the error variance
eps<-as.vector(Y-V%*%b)
sighat2<-mean(eps^2)

#calculate asymptotic covariance matrix
covmat<-solve(t(V)%*%V)*sighat2
covmattheta<-covmat[1:(K+4),1:(K+4)];covmatbeta=covmat[(K+5):p,(K+5):p]

#calculate function values on a grid, with pointwise CI
Bgrid<-splineDesign(knots=c(0,0,0,seq(0,1,length=K+2),1,1,1),x=grid)
fgrid<-Bgrid%*%theta
upper<-fgrid+qnorm(1-alpha/2)*sqrt(diag(Bgrid%*%covmattheta%*%t(Bgrid)))
lower<-fgrid-qnorm(1-alpha/2)*sqrt(diag(Bgrid%*%covmattheta%*%t(Bgrid)))

return(list(beta=beta,theta=theta,covmattheta=covmattheta,covmatbeta=covmatbeta,
         grid=grid, f=fgrid, upper=upper, lower=lower))

}


 
 
  