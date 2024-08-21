clc; clear; format long G

data=[  -0.0025  -0.0005 
  0.5116  0.0181 
  1.0107  0.0346 
  1.5074  0.0540 
  1.9928  0.0742 
  2.5044  0.0939 
  2.9762  0.1126 
  3.4857  0.1321 
  4.0157  0.1510 
  4.5033  0.1748 
  4.9826  0.1968 
  5.4982  0.2192 
  6.0057  0.2401 
  6.4955  0.2638 
  7.0052  0.2838 
  7.5004  0.3103 
  8.0030  0.3352 
  8.4833  0.3559 
  9.0152  0.3801 
  9.4884  0.4042 
  10.0057  0.4279 
  10.5024  0.4508 
  10.9787  0.4742 
  11.4774  0.4961 
  12.0047  0.5209 
  12.4800  0.5427 
  13.0157  0.5653 
  13.4956  0.5861 
  14.0111  0.6096 
  14.4875  0.6313 
  15.0179  0.6517 
  15.5046  0.6708 
  15.9944  0.6908 
  16.5001  0.7104 
  17.0027  0.7294 
  17.4952  0.7449 
  17.9835  0.7597 
  18.5034  0.7768 
  18.9913  0.7893 
  19.5002  0.8009 
  20.0084  0.8115 
  20.4860  0.8198 
  20.9943  0.8274 
  21.4916  0.8338 
  21.9805  0.8369 
  22.5126  0.8370 
  23.0056  0.8375 
  23.4907  0.8343 
  23.9841  0.8284 
  24.5032  0.8198 
  24.9982  0.8099 
  25.5024  0.7946 
  26.0017  0.7789 
  26.5133  0.7583 
  27.0155  0.7367 
  27.5051  0.7098 
  27.9883  0.6738 
  28.4878  0.6392 
  29.0039  0.5976 
  29.5064  0.5581 
  30.0141  0.5106 
  30.5023  0.4585 
  30.9880  0.3982 
  31.4887  0.3349 
  32.0085  0.2677 
  32.5010  0.1879 
  32.9862  0.1107 
  33.5155  0.0224 
  33.9844  -0.0732 
  34.4985  -0.1761 
  34.9944  -0.2775 
  35.5031  -0.3976 
  35.9944  -0.5209 
  36.5037  -0.6541 
  36.9930  -0.7910 
  37.5002  -0.9330 
  37.9901  -1.1064 
  38.5105  -1.2648 
  38.9979  -1.4322 
  39.4944  -1.6295 
  40.0074  -1.8324 
  40.5054  -2.0388 
  40.9931  -2.2528 
  41.4977  -2.4863 
  41.9801  -2.7222 
  42.5074  -2.9835 
  42.9756  -3.2511 
  43.5093  -3.5204 
  44.0095  -3.8281 
  44.4743  -4.1261 
  44.9817  -4.4599 
  45.5121  -4.7879 
  45.9957  -5.1479 
  46.5015  -5.5276 
  46.9952  -5.9019 
  47.4993  -6.3110 
  47.9879  -6.7271 
  48.5010  -7.1579 
  48.9969  -7.6201 
  49.5093  -8.1034];

x=data(:,1);
y=data(:,2);
%% polynom 

A=[ones(size(data,1),1),data(:,1),data(:,1).^2,data(:,1).^3,data(:,1).^4,data(:,1).^5];
l=data(:,2);
a_vys={};
v_vys={}
Ma_vys={};
k=size(data,1);

for n=1:6
    a=inv(A(:,1:n)'*A(:,1:n))*A(:,1:n)'*l;
    v=A(:,1:n)*a-l;
    s0(n)=sqrt((v'*v)/(k-((n-1)+1)));
    Ma=s0(n)^2*inv(A(:,1:n)'*A(:,1:n));
    
    a_vys=[a_vys;a];
    v_vys=[v_vys;v];
    Ma_vys=[Ma_vys;sqrt(diag(Ma))];
end

n=0:n-1;
figure(1)
plot(n,s0)
title('velikosti s_0 v závislosti na stupni polynomu')
xlabel('stupeň volnosti')
ylabel('směrodatná odchylka jednotková s_0')

n=1:k;
figure(2)
plot(n,v)
title('velikosti oprav pro nejvyšší stupeň polynomu')
xlabel('oprava')
ylabel('hodnota opravy')

% M=[n',data];
% M=[M(1:25,:),M(26:50,:),M(51:75,:),M(76:100,:)];
% uuuu=mat2latextable(M)