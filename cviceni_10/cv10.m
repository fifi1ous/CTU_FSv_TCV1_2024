clc; clear; format long G

m=load('zadani_19.txt');

figure(1)
plot(m(:,1),m(:,2));
xlabel('t')
ylabel('hodnota')
title('Nezpracované hodnoty v závislosti na čase')


L=size(m,1);

Y = fft(m(:,2));

P2 = abs(Y/L); %L je počet dat
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1); %Amplitudy

Fs=1000;

f = Fs*(0:(L/2))/L; %Fs = 1000, f = frekvence
figure(2);
plot(f,P1)
title('Amplitutda v závislosti na frekvenci')
xlabel('f (Hz)')
ylabel('|P1(f)|')


[peaks2,index]=findpeaks(P1,'MinPeakProminence',0.3);
peaks=[peaks2,f(index)'];
frek=f(index)';

a=real(Y(index)); %reálná část z FFT
b=imag(Y(index)); %imaginární část z FFT
phase=atan2(b,a) + pi/2; %fázový posun v radiánech

y=0;
for n=1:length(peaks)
    y=y+peaks2(n)*sin(2*pi*frek(n).*m(:,1)+phase(n));
end

figure(3)
plot(m(:,1),y);
xlabel('t')
ylabel('hodnota')
title('Zpracované data')

figure(4)
plot(m(:,1),m(:,2),'k');
xlabel('t')
ylabel('hodnota')
hold on
plot(m(:,1),y,'r');
xlabel('t')
ylabel('hodnota')
title('Porovnání nezpracovaných dat a zpracovaných dad')