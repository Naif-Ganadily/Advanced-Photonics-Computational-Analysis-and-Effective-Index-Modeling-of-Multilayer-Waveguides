function [neff]=Neff_lateral(nfilm,nclad,nsub,wf,lambda)
ko=2*pi/lambda;
G_fm= sqrt((ko^2)*(nfilm^2-nsub^2));
G_f=linspace(0,G_fm,100)
for i=1:length(G_f)
    Gc(i)=G_clad(ko,G_f(i),nclad,nfilm);
    Gs(i)=G_sub(ko,G_f(i),nsub,nfilm);
    B(i)=sqrt(((nfilm*ko)^2)-G_f(i)^2);
    neff(i)= (B(i))/ko;
end
 neff=mean(neff);
end
