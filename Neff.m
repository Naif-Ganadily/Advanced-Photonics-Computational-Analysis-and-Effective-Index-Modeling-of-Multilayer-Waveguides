function [neff ko]=Neff(nfilm,nclad,nsub,wf,lambda)
ko=2*pi/lambda;
G_fm= sqrt((ko^2)*(nfilm^2-nsub^2));
G_f=linspace(0,G_fm,100)
LHS=tan(wf.*G_f);
for i=1:length(G_f)
    Gc(i)=G_clad(ko,G_f(i),nclad,nfilm);
    Gs(i)=G_sub(ko,G_f(i),nsub,nfilm);
    RHS(i)=(Gc(i)+Gs(i))/(G_f(i)*(1-(Gc(i)*Gs(i)/G_f(i)^2)));
    B(i)=sqrt(((nfilm*ko)^2)-G_f(i)^2);
    
end
[c,ia,ib]=intersect(round(LHS,3),round(RHS,3));
 B=B(ib);
 neff=B/ko;
 neff=mean(neff);
end

