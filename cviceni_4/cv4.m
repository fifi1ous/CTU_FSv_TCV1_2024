clc; clear; format long G

sigma0 = 1.0;
alpha=0.05;

soubor1=[0.2220 0.2221 0.2214 0.2221 0.2210 0.2214 0.2221 0.2219 0.2223 0.2220 0.2217 0.2215 0.2219 0.2218 0.2217 0.2217 0.2214 0.2216 0.2216 0.2218 0.2217 0.2217 0.2219 0.2213 0.2218 0.2218 0.2220 0.2221 0.2226 0.2216 0.2222 0.2216 0.2212 0.2221 0.2219 0.2222 0.2217 0.2222 0.2223 0.2216];
soubor2=[0.2220 0.2218 0.2219 0.2217 0.2222 0.2217 0.2221 0.2216 0.2221 0.2219 0.2220 0.2217 0.2214 0.2216 0.2219 0.2214 0.2220 0.2213 0.2217 0.2214 0.2217 0.2214 0.2221 0.2219 0.2226 0.2223 0.2218 0.2218 0.2222 0.2217];

%% př1
s1=std(soubor1)*1000;
s0=s1/sqrt(2)*sqrt(1000/60);
chi=(length(soubor1)-1)/(sigma0^2)*(s0^2);

chi_hor=chi2inv(1-alpha/2, length(soubor1)-1);
chi_dol=chi2inv(alpha/2, length(soubor1)-1);

if chi_dol>chi && chi_hor<chi
    fprintf('Zamítáme nulovou hypotézu\n')
else
    fprintf('Nezamítáme nulovou hypotézu\n')
end

%% př2
s2=std(soubor2)*1000;
F=s1^2/s2^2;
F0=finv(1-alpha/2, length(soubor1)-1, length(soubor2)-1);

if F>F0
    fprintf('Zamítáme nulovou hypotézu\n')
else
    fprintf('Nezamítáme nulovou hypotézu\n')
end
%% př3
n1=length(soubor1);
n2=length(soubor2);

x1=mean(soubor1)*1000;
x2=mean(soubor2)*1000;

t=(abs((x1-x2))/sqrt((n1-1)*s1^2+(n2-1)*s2^2))*sqrt(n1+n2-2)*sqrt((n1*n2)/(n1+n2));
t_mez=tinv(1-alpha/2, n1+ n2-2);

if t>t_mez
    fprintf('Zamítáme nulovou hypotézu\n')
else
    fprintf('Nezamítáme nulovou hypotézu\n')
end