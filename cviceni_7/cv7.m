clc; clear; format Long G
 
m=[    1 109.7033 
    2 109.6681 
    3 109.7218 
    4 109.6955 
    5 109.7431 
    6 109.7021 
    7 109.7568 
    8 109.6941 
    9 109.6891 
   10 109.6912 
   11 109.6694 
   12 109.7163 
   13 109.6990 
   14 109.6681 
   15 109.7013 
   16 109.7271 
   17 109.7588 
   18 109.6858 
   19 109.7219 
   20 109.7343 
   21 109.7243 
   22 109.7184 
   23 109.6704 
   24 109.7212 
   25 109.6687 
   26 109.7698 
   27 109.6807 
   28 109.6681 
   29 109.7017 
   30 109.6930 
   31 109.6712 
   32 109.6855 
   33 109.7048 
   34 109.6681 
   35 109.6849 
   36 109.6681 
   37 109.7244 
   38 109.7341 
   39 109.6915 
   40 109.7798 
   41 109.6841 
   42 109.7092 
   43 109.6958 
   44 109.6681 
   45 109.8468 
   46 109.6913 
   47 109.7320 
   48 109.7431 
   49 109.6857 
   50 109.7227 ];


sd =  0.025 ;
up=2;

mer=m(:,2);

SMd=[];
Vys=[];

for n=1:3
    if n==1
        [Vysledek,Smer,MIN,vmin]=rob(mer,min(mer),sd,up);
        Vys=[Vys;Vysledek];
        SMd=[SMd;Smer];
        vmin=round(vmin,4);
    elseif n==2
        [Vysledek,Smer,MAX,vmax]=rob(mer,max(mer),sd,up);
        Vys=[Vys;Vysledek];
        SMd=[SMd;Smer];
        vmax=round(vmax,4);
    else
        [Vysledek,Smer,PRUM,vprum]=rob(mer,mean(mer),sd,up);
        Vys=[Vys;Vysledek];
        SMd=[SMd;Smer];
        vprum=round(vprum,4);
    end
end

function [Vysledek,SMd,T,v]=rob(mer,Prum,sd,up)
    PrumKont=1000;
    while abs(Prum-PrumKont)>0.00001
        v=Prum-mer;
        v(abs(v)<=1e-12)=1e-12;
        W=1./abs(v);
        PrumKont=Prum;
        Prum=(W'*mer)/sum(W);
    end
    v=abs(Prum-mer);
    V_max=up*sd;
    T=find(abs(v)>V_max);
    mer(T)=[];

    Vysledek=mean(mer);
    SMd=std(mer);
end