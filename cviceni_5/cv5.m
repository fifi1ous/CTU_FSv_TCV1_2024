clc; clear; format long G
rad=pi/200;
koef=2;
%% příklad č. 1
d1 = 124.687; sigma1 = 0.005;
d2 = 124.656 ; sigma2 = 0.015;

rozdilL1=d1-d2;
Sigma_ROZ=sqrt(sigma1^2+sigma2^2);
rozdilM1=koef*Sigma_ROZ;


%% příklad č. 2
Sigma = 0.0015;
Omega1 = 75.6565;
Omega2 = 75.6612;
Omega3 = 75.6594;

rozdilO2=Omega1-Omega2;
Sigma_ROZ2=sqrt(2)*Sigma;
rozdilM2=koef*Sigma_ROZ2;

uhel2=[Omega1,Omega2,Omega3];
OMEGA_roz2=mean(uhel2)-uhel2
mez2=1.74*Sigma
mean(uhel2)

%% příklad č. 3
sigma = 0.0003;
omega1 = 128.6836;
omega2 = 128.6829;
omega3 = 128.6831;
omega4 = 128.6837;
omega5 = 128.6821;
omega6 = 128.6834;

uhel3=[omega1,omega2,omega3,omega4,omega5];
OMEGA_roz3=mean(uhel3)-uhel3;
mez3=2.08*sigma;

uhel32=[omega1,omega2,omega3,omega4,omega5,omega6];
OMEGA_roz32=mean(uhel32)-uhel32;
mez32=2.18*sigma;
 
uhel33=[omega1,omega2,omega3,omega4,omega6];
OMEGA_roz33=mean(uhel33)-uhel33;
mez32=2.08*sigma;
mean(uhel33);
%% příklad č. 4
m=[1 88.7607
2 88.7607
3 88.7620
4 88.7653
5 88.7461
6 88.7700
7 88.7689
8 88.7538
9 88.7668
10 88.7701
11 88.7631
12 88.7623
13 88.7567
14 88.7644
15 88.7736
16 88.7699
17 88.7692
18 88.7545
19 88.7647
20 88.7622
21 88.7620
22 88.7689
23 88.7657
24 88.7655
25 88.7722
26 88.7632
27 88.7631
28 88.7648
29 88.7710
30 88.7600];
m=m(:,2);

n=length(m);
s4=std(m);
opr4=mean(m)-m;
mez4=2.908*s4;

pom=zeros(1,n);
for j=1:n
    if abs(opr4(j))<mez4
        pom(j)=1;
    end
end

t=find(pom==0);
m(t)=[];

n=length(m);
s41=std(m);
opr41=mean(m)-m;
mez41=2.893*s41;
pom1=zeros(1,n);
for j=1:n
    if abs(opr41(j))<mez41
        pom1(j)=1;
    end
end
mean(m);