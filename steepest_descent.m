clc 
clear all
syms x1;
syms x2;
f=x1-x2+2*x1^2+2*x1*x2+x2^2;
fx=inline(f)
x0=[1 1]
fxx=@(x) fx(x(1),x(2))

g=gradient(f)
gx=inline(g)
%gxx=gx(x0(1),x0(2))
gxx=@(x) gx(x(1),x(2))
h=hessian(f)
hx=inline(h)

tol=1e-3
maxiter=50
iter=0

while (norm(gxx(x0))>tol && iter<maxiter)
    s=-gxx(x0)
    lambda=s'*s/(s'*hx(x0)*s)
    Xnew=x0+lambda*s'
    x0=Xnew
    iter=iter+1
end
x0