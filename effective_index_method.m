
%% Effective Index calculation

n_film=3.50125;             %% refractive index of Si0.65Ge0.35
n_clad=3.5;             %% refractive index of Si cladding
n_clad_boundary=1;         %% refractive index of Air
n_sub=3.5;               %% refractive index of Si substrate
Wfc=6.5;                    %% central dimension of SiGe film in x axis
Wfb=5.4;                   %%  dimension of SiGe film at the bounadry
Wx=12;                      %%  dimension of SiGe film in y axis
Lambda=1.32;

[Neff_center,ko]=Neff(n_film,n_clad,n_sub,Wfc,Lambda);
Neff_boundary=Neff(n_film,n_clad_boundary,n_sub,Wfb,Lambda);
Neff_overall=Neff_lateral(Neff_center,Neff_boundary,Neff_boundary,Wx,Lambda);

%%
%%%-----------------E-Field Distribution in X-Axis----------------%%%

% [neff ko]=Neff(nfilm,nclad,nsub,wf,ws,wc,lambda)
% [neff]=Neff_lateral(nfilm,nclad,nsub,wf,ws,wc,lambda)

%%% Function calling for effective index %%%

[Neff_center,ko]=Neff(3.50125,3.5,3.5,6.5,1.32);
Neff_boundary=Neff(3.50125,1,3.5,5.4,1.32);
Neff_overall=Neff_lateral(3.5008,3.5001,3.5001,12,1.32);

Wf=12e-6;              %% dimension of Si Film in x axis
n_film=Neff_center;    %% effective index of film
B=ko*Neff_overall;
G_film=sqrt((ko*n_film)^2-B^2);
G_clad=sqrt((ko*n_clad)^2-B^2);
G_sub=sqrt((ko*n_sub)^2-B^2);

C1=cos(G_film*Wf);
C2=sin(G_film*Wf);
A=1;
D=1;
B=G_sub/G_film;
Cc=B*C2+C1;
x1=0:0.01e-6:Wf;
Efilm=A*cos(G_film*x1)+B*sin(G_film*x1);

x2=-8e-6:0.01e-6:0;
Esub=D*exp(G_sub*x2);

x3=Wf:0.01e-6:8e-6;
Eclad=Cc*exp(-G_clad*(x3-Wf));

figure(1)
plot(x1,(Efilm),'r')
hold on
plot(x2,(Esub),'r')
hold on
plot(x3,Eclad,'r')
xlabel('Dimension Y-axis(um)');
ylabel('E-field(V/um) in Y-axis');

%%
%%%-----------------E-Field Distribution in Y-Axis----------------%%%

% [neff ko]=Neff(nfilm,nclad,nsub,wf,ws,wc,lambda)
% [neff]=Neff_lateral(nfilm,nclad,nsub,wf,ws,wc,lambda)

%%% Function calling for effective index %%%
[Neff_center,ko]=Neff(3.50125,3.5,3.5,6.5,1.32);
Neff_boundary=Neff(3.50125,1,3.5,5.4,1.32);
Neff_overall=Neff_lateral(3.5008,3.5001,3.5001,12,1.32);

Wfy=5.4e-6;
n_film=Neff_center;
B=ko*Neff_overall;
G_film=sqrt((ko*n_film)^2-B^2);
G_clad=sqrt((ko*n_clad)^2-B^2);
G_sub=sqrt((ko*n_sub)^2-B^2);
% 
C1=cos(G_film*Wfy);
C2=sin(G_film*Wfy);
A=1;
D=1;
B=G_sub/G_film;
Cc=B*C2+C1;
y1=0:0.01e-6:Wfy;
Efilmy=A*cos(G_film*y1)+B*sin(G_film*y1);

y2=-8e-6:0.01e-6:0;
Esuby=D*exp(G_sub*y2);

y3=Wfy:0.01e-6:8e-6;
Eclady=Cc*exp(G_clad*(y3-Wfy));

figure(2)
plot((Efilmy),y1,'r')
hold on
plot((Esuby),y2,'r')
hold on
plot(Eclady,y3,'r')
ylabel('Dimension X-Axis(um)');
xlabel('E-field(V/um) in X-axis');