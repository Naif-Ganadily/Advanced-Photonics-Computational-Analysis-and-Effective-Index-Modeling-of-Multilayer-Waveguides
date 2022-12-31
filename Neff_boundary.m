function [neff]=Neff_lateral(nfilm,nclad,nsub,wf,ws,wc,lambda)
ko=2*pi/lambda;
G_fm= sqrt((ko^2)*(nfilm^2-nsub^2));
G_fm1= sqrt((ko^2)*(nfilm^2-nclad^2));
G_f=linspace(0,G_fm,1000)
G_f1=linspace(0,G_fm1,1000)
LHS=tan(wf*G_f);
for i=1:length(G_f)
    Gc(i)=G_clad(ko,G_f(i),nclad,nfilm);
    Gs(i)=G_sub(ko,G_f(i),nsub,nfilm);
    B(i)=sqrt(((nfilm*ko)^2)-G_f(i)^2);
     B1(i)=sqrt(((nfilm*ko)^2)-G_f1(i)^2);
    neff(i)= (B(i)+B)/ko;
end
