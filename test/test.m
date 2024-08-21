clc; clear; format long G

%Příklad č.1
M=[139500.000	2.500	489.900
139505.000	2.500	490.003
139510.000	2.500	490.112
139515.000	2.500	490.196
139520.000	2.500	490.300
139525.000	2.500	490.399
139530.000	2.500	490.490
139535.000	2.500	490.597
139540.000	2.500	490.691
139545.000	2.500	490.804
139550.000	2.500	490.895
139555.000	2.500	491.000
139560.000	2.500	491.097
139500.000	8.000	489.681
139505.000	8.000	489.776
139510.000	8.000	489.882
139515.000	8.000	489.983
139520.000	8.000	490.088
139525.000	8.000	490.179
139530.000	8.000	490.269
139535.000	8.000	490.375
139540.000	8.000	490.486
139545.000	8.000	490.574
139550.000	8.000	490.684
139555.000	8.000	490.780
139560.000	8.000	490.887
139500.000	13.500	489.450
139505.000	13.500	489.559
139510.000	13.500	489.653
139515.000	13.500	489.774
139520.000	13.500	489.864
139525.000	13.500	489.966
139530.000	13.500	490.054
139535.000	13.500	490.157
139540.000	13.500	490.258
139545.000	13.500	490.365
139550.000	13.500	490.458
139555.000	13.500	490.563
139560.000	13.500	490.649];

pom=size(M,1);
A=[M(:,1),M(:,2),ones(pom,1)];
l=M(:,3);

dx=inv(A'*A)*A'*l;
dx_procenta=round(dx(1:2)*100,2)

v=A*dx-l;

s0=sqrt((v'*v)/(pom-1));

Mx=sqrt(diag(s0^2*inv(A'*A)))

%% Příklad č.2
N=[0	0.000
20	0.053
40	0.365
60	1.240
70	1.987
80	2.958
90	4.205
100	5.756
110	7.641
120	9.943
130	12.649
140	15.782
150	19.416];

l=N(:,2);
A=N(:,1).^3;

b=inv(A'*A)*A'*l

v=A*b-l;

s0=sqrt((v'*v)/(size(N,1)-1))

Mx=sqrt(diag(s0^2*inv(A'*A)))