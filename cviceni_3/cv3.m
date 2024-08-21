clc; clear; format long G
%           x         y         z
P = [1 1076.67002 5052.69000 10.13006
     2 999.45999  5043.81997  9.87003];

M = [ 0.36530562 0.3084925 -0.00071174539 0.096825954 0.29861741 -7.6633318e-05
0.3084925 0.38369751 -0.00053362867 0.29450484 0.47854828 -0.00038348066
-0.00071174539 -0.00053362867 1.4289532 -7.3412977e-05 -0.00036016491 1.0413036
0.096825954 0.29450484 -7.3412977e-05 0.39328453 0.45221941 -0.00056870869
0.29861741 0.47854828 -0.00036016491 0.45221941 2.1109087 -0.00082007002
-7.6633318e-05 -0.00038348066 1.0413036 -0.00056870869 -0.00082007002 1.7362466];


nez={'X1' 'Y1' 'Z1' 'X2' 'Y2' 'Z2'};
NEZ=cell2sym(nez);

vod=sqrt((NEZ(1)-NEZ(4))^2+(NEZ(2)-NEZ(5))^2);
sik=sqrt((NEZ(1)-NEZ(4))^2+(NEZ(2)-NEZ(5))^2+(NEZ(3)-NEZ(6))^2);
prev=NEZ(3)-NEZ(6);

p=[P(1,2:end),P(2,2:end)];

VOD=sqrt((p(1)-p(4))^2+(p(2)-p(5))^2);
SIK=sqrt((p(1)-p(4))^2+(p(2)-p(5))^2+(p(3)-p(6))^2);
PREV=p(6)-p(3);

for n=1:length(NEZ)
    vodD(n)=diff(vod,NEZ(n));
    sikD(n)=diff(sik,NEZ(n));
    prevD(n)=diff(prev,NEZ(n));
    
    VODD(n)=eval(subs(vodD(n),NEZ,p));
    SIKD(n)=eval(subs(sikD(n),NEZ,p));
    PREVD(n)=eval(subs(prevD(n),NEZ,p));
end

sdVOD=sqrt(VODD*M*VODD');
sdSIK=sqrt(SIKD*M*SIKD');
sdPREV=sqrt(PREVD*M*PREVD');

vysledky=array2table([VOD,sdVOD;SIK,sdSIK;PREV,sdPREV]);

%% priklad 2
M2=[4.8291762e+001 1.5219707e+000 5.0725459e+000 2.2670059e+000 5.2414534e+000 4.0270924e+000 -4.2671151e-002 -1.5287480e-001 6.6954376e+000 5.5093773e+000 4.2671151e-002 1.5287480e-001 2.9196015e+001 -1.9405712e+000 1.7548710e+000 1.5374910e+000 -8.7587002e-002 1.1640411e+000 4.1703248e+000 1.7814937e+000 3.8030045e+000 -1.1640411e+000 -4.1703248e+000 1.7102923e+001 -2.1955157e-001 3.0768206e+000 3.0983982e+000 -6.5643825e-001 -2.3517731e+000 3.0801106e+000 -1.7300690e+000 6.5643825e-001 2.3517731e+000 1.5447092e+001 2.5308850e+000 3.2403662e+000 4.5349550e-001 1.6247050e+000 2.3147389e+000 6.4027109e+000 -4.5349550e-001 -1.6247050e+000 4.5641432e+001 3.3240288e+001 3.3076937e-001 1.1850231e+000 2.7723173e+001 2.2525133e+001 -3.3076937e-001 -1.1850231e+000 5.6553078e+001 -1.0727725e-001 -3.8433432e-001 1.7740695e+001 1.7158044e+001 1.0727725e-001 3.8433432e-001 3.3242765e-001 1.1909641e+000 3.7054377e-001 9.7058098e-001 -3.3242765e-001 -1.1909641e+000 4.2667797e+000 1.3275199e+000 3.4772292e+000 -1.1909641e+000 -4.2667797e+000 3.7852814e+001 3.0536254e+001 -3.7054377e-001 -1.3275199e+000 3.7858353e+001 -9.7058098e-001 -3.4772292e+000 3.3242765e-001 1.1909641e+000 4.2667797e+000];


% m3=[4.8291762e+001 1.5219707e+000 5.0725459e+000 2.2670059e+000 5.2414534e+000 4.0270924e+000 -4.2671151e-002 -1.5287480e-001 6.6954376e+000 5.5093773e+000 4.2671151e-002 1.5287480e-001 
%             0      2.9196015e+001 -1.9405712e+000 1.7548710e+000 1.5374910e+000 -8.7587002e-002 1.1640411e+000 4.1703248e+000 1.7814937e+000 3.8030045e+000 -1.1640411e+000 -4.1703248e+000 
%             0           0         1.7102923e+001 -2.1955157e-001 3.0768206e+000 3.0983982e+000 -6.5643825e-001 -2.3517731e+000 3.0801106e+000 -1.7300690e+000 6.5643825e-001 2.3517731e+000 
%             0           0               0         1.5447092e+001 2.5308850e+000 3.2403662e+000 4.5349550e-001 1.6247050e+000 2.3147389e+000 6.4027109e+000 -4.5349550e-001 -1.6247050e+000 
%             0           0               0               0        4.5641432e+001 3.3240288e+001 3.3076937e-001 1.1850231e+000 2.7723173e+001 2.2525133e+001 -3.3076937e-001 -1.1850231e+000 
%             0           0               0               0               0       5.6553078e+001 -1.0727725e-001 -3.8433432e-001 1.7740695e+001 1.7158044e+001 1.0727725e-001 3.8433432e-001 
%             0           0               0               0               0             0         3.3242765e-001 1.1909641e+000 3.7054377e-001 9.7058098e-001 -3.3242765e-001 -1.1909641e+000 
%             0           0               0               0               0             0               0        4.2667797e+000 1.3275199e+000 3.4772292e+000 -1.1909641e+000 -4.2667797e+000 
%             0           0               0               0               0             0               0               0       3.7852814e+001 3.0536254e+001 -3.7054377e-001 -1.3275199e+000 
%             0           0               0               0               0             0               0               0             0        3.7858353e+001 -9.7058098e-001 -3.4772292e+000 
%             0           0               0               0               0             0               0               0             0               0        3.3242765e-001 1.1909641e+000 
%             0           0               0               0               0             0               0               0             0               0              0        4.2667797e+000];
% 
% m4=m3';
% M_3 = m4 - diag(diag(m4))+m3;

clear NEZ nez
n = 12; 
M_2 = zeros(n);
k = 1;
for i = 1:n
    for j = i:n
        M_2(i, j) = M2(k);
        M_2(j, i) = M2(k);
        k = k + 1;
    end
end

BODY=[6765.10822 1220.42163
      6705.79191 1222.57532
      6724.85816 1433.41172
      6778.44995 1034.53982
      6489.61391 1489.45054
      6856.27005 1313.34018];

Poradi=[1,2,2,3,4,3,5,1,6,2];
 
i=1;
SOR=[];
for n=1:2:length(Poradi)
    Vod_D(i)=sqrt((BODY(Poradi(n),1)-BODY(Poradi(n+1),1))^2+(BODY(Poradi(n),2)-BODY(Poradi(n+1),2))^2);
    i=i+1;
end

xy1 = [6765.10822 1220.42163];
xy2 = [6705.79191 1222.57532];
xy3 = [6724.85816 1433.41172];
xy4001 = [6778.44995 1034.53982];
xy4002 = [6489.61391 1489.45054];
xy4003 = [6856.27005 1313.34018];

syms X1 Y1 X2 Y2
vd = sqrt((X2-X1)^2+(Y2-Y1)^2);

vd12= eval(subs([diff(vd,X1) diff(vd,Y1)  diff(vd,X2) diff(vd,Y2) 0 0 0 0 0 0 0 0],[X1 Y1 X2 Y2],[xy1,xy2]));
vd23 = eval(subs([0 0 diff(vd,X1) diff(vd,Y1)  diff(vd,X2) diff(vd,Y2) 0 0 0 0 0 0],[X1 Y1 X2 Y2],[xy2,xy3]));
vd40013 = eval(subs([0 0 0 0 diff(vd,X2) diff(vd,Y2)  diff(vd,X1) diff(vd,Y1) 0 0 0 0],[X1 Y1 X2 Y2],[xy4001,xy3]));
vd40021 = eval(subs([diff(vd,X2) diff(vd,Y2) 0 0 0 0 0 0 diff(vd,X1) diff(vd,Y1) 0 0],[X1 Y1 X2 Y2],[xy4002,xy1]));
vd40032 = eval(subs([0 0 diff(vd,X2) diff(vd,Y2) 0 0 0 0 0 0 diff(vd,X1) diff(vd,Y1)],[X1 Y1 X2 Y2],[xy4003,xy2]));

S=[sqrt(vd12*M_2*vd12');sqrt(vd23*M_2*vd23');sqrt(vd40013*M_2*vd40013');sqrt(vd40021*M_2*vd40021');sqrt(vd40032*M_2*vd40032')];