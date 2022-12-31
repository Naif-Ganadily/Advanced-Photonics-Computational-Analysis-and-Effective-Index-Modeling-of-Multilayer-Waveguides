%% Neffective in central X-axis 

m=0;
lambda=1.32e-6;
h1=3.4e-6;               %% Film dimension in central x-axis
k=(2.*pi)/lambda;
nc=1;
ns=3.50;
nf=3.50125;
%%% implementation of Dispersion equation
N=linspace(ns,nf,100000);
b=(N.^2-ns.^2)./(nf.^2-ns.^2);
LHS_c=sqrt(nf.^2-ns.^2).*k.*h1;
RHS_c=m.*pi+atan(sqrt(b./(1+b)))+ atan(sqrt((b)./(1-b)));

[c,ia,iy]=intersect(round(LHS_c,1),round((RHS_c),1));

%%% Neff in the central X-axis
Neff_c=N(iy);

%%% confinement in X-Axis
Tx= (LHS_c+ 2*(b(iy))^1/2)/(LHS_c+ 2*(b(iy))^-1/2);

%% Neffective in boundary X-axis 
nc=1;
ns=3.50;
nf=3.50125;
V=sqrt(nf.^2-ns.^2).*k.*h1;
a=(ns.^2-nc.^2)./(nf.^2-ns.^2);
%%% from graph of V vs b, the value of V=1.51 and a=10.5 line ; the value of b=0.05
b_s=0.05;

%%% Neff in the central X-axis
Neff_b= sqrt(ns^2+b_s *(nf^2-ns^2));

%% Neffective in Y axis
m=1;
lambda=1.32e-6;
h2=14e-6;                   %% Film dimension in central y-axis
k=(2.*pi)/lambda;
nc=Neff_b;
ns=Neff_b;
nf=Neff_c;

%%% implementation of Dispersion equation

N_y=linspace(ns,nf,10000);
b=(N_y.^2-ns.^2)./(nf.^2-ns.^2);
LHS_y=sqrt(nf.^2-ns.^2).*k.*h2;
RHS_y=m.*pi+atan(sqrt(b./(1+b)))+ atan(sqrt((b)./(1-b)));

[c,ia,iy]=intersect(round(LHS_y,2),round((RHS_y),2));

%%% Neff in the central y-axis
Neff_y=N_y(iy);

%%% confinement in Y-Axis
Ty= (LHS_y+ 2*(b(iy))^1/2)/(LHS_y+ 2*(b(iy))^-1/2);

%% confinement factor

TxTy=Tx*Ty;

%% E-field in Y-axis

Wf=14e-6;              %% dimension of Si Film in x axis
lambda=1.32e-6;
k=2*pi/lambda;
n_clad=Neff_b;
n_sub=Neff_b;
n_film=Neff_c;            %% refractive index of substrate 
B=k*Neff_y;
G_film=sqrt((k*n_film)^2-B^2);
G_clad=sqrt(-(k*n_clad)^2+B^2);
G_sub=sqrt(-(k*n_sub)^2+B^2);

C1=cos(G_film*Wf);
C2=sin(G_film*Wf);
A=1;
D=1;
B=G_sub/G_film;
Cc=B*C2+C1;
x1=0:0.01e-6:Wf;
Efilm=A*cos(G_film*x1)+B*sin(G_film*x1);

x2=-10e-6:0.01e-6:0;
Esub=D*exp(G_sub*x2);

x3=Wf:0.01e-6:10e-6;
Eclad=Cc*exp(-G_clad*(x3-Wf));

figure(1)
plot(x1,(Efilm),'r')
hold on
plot(x2,(Esub),'r')
hold on
plot(x3,Eclad,'r')
xlabel('Dimension Y-axis(um)');
ylabel('E-field in Y-axis');

%% E-field in X-axis
lambda=1.32e-6;
ko=2*pi/lambda;
Wfy=3.4e-6;
n_clad=Neff_b;
n_sub=Neff_b;
n_film=Neff_c;            
B=k*Neff_y;
G_film=sqrt((ko*n_film)^2-B^2);
G_clad=sqrt(-(ko*n_clad)^2+B^2);
G_sub=sqrt(-(ko*n_sub)^2+B^2);
% 
C1=cos(G_film*Wfy);
C2=sin(G_film*Wfy);
A=1;
D=1;
B=G_sub/G_film;
Cc=B*C2+C1;
y1=0:0.01e-6:Wfy;
Efilmy=A*cos(G_film*y1)+B*sin(G_film*y1);

y2=-11e-6:0.01e-6:0;
Esuby=D*exp(G_sub*y2);

y3=Wfy:0.01e-6:11e-6;
Eclady=Cc*exp(G_clad*(Wfy-y3));

figure(2)
plot((Efilmy),y1,'r')
hold on
plot((Esuby),y2,'r')
hold on
plot(Eclady,y3,'r')
ylabel('Dimension X-Axis(um)');
xlabel('E-field in X-axis');