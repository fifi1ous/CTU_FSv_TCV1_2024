clc; clear; format long G

data={'2.1.2018'	0	
	'1.4.2018'	1.0	
	'1.7.2018'	3.7	
	'1.10.2018'	3.6	
	'2.1.2019'	3.6	
	'1.4.2019'	3.7	
	'1.7.2019'	4.5	
	'1.10.2019'	4.2	
	'2.1.2020'	4.9	
	'1.4.2020'	6.1	
	'1.7.2020'	5.9	
	'1.10.2020'	5.2	
	'2.1.2021'	7.6	
	'1.4.2021'	10.1	
	'1.7.2021'	7.6	
	'1.10.2021'	9.9	
	'2.1.2022'	10.6	
	'1.4.2022'	11.9	
	'1.7.2022'	13.9	
	'1.10.2022'	13.6};


datum=datenum(data(:,1),'dd.mm.yyyy');
val=cell2mat(data(:,2));

xT=mean(datum); yT=mean(val);
xR=datum-xT; yR=val-yT;

By=(xR'*xR)^(-1)*xR'*yR;
vy=By*xR-yR;


n=size(data,1);
s0=sqrt((vy'*vy)/(n-2));
Sby=s0/sqrt(xR'*xR);

if By<2*Sby
    fprintf('nulovou hypotézu nezamítáme')
else
    fprintf('zamítáme nulovou hypotézu a pokládáme koeficient By za důvěryhodný')
end

Bx=(xR'*yR)^(-1)*yR'*yR;

r=sqrt(By/Bx);

roc_p=365*By;


