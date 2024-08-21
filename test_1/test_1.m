clc; clear; format long G
% Varianta D:

%     Ha       Hb      Hc       Hd
H = [300.489 304.735 306.715 301.478];

M = [ 89.02 -16.17  -38.02  15.52
     -16.17  12.85   13.77  -3.866
     -38.02  13.77   20.34  -2.382
      15.52 -3.866  -2.382  15.47 ];
  
  Hca=H(3)-H(1);
  Hbd=H(2)-H(4);
  
  Fca=[-1,0,1,0];
  Fbd=[0,1,0,-1];
  
  sca=sqrt(Fca*M*Fca');
  sbd=sqrt(Fbd*M*Fbd');