%%
clc
clear all;
data = importdata('C:\Users\Administrator\Desktop\20180729\20180729_13h02m11s.txt');
%%
figure,
plot(data(:,3))
%%
y = data(200:end,3);
Fs = 2000;
frame=(1:length(y))';
t1=(1:length(y))/Fs;
opol = 6;
[p,s,mu] = polyfit(frame,y,opol); 
f_y = polyval(p, frame,[],mu); 
dt_ecgnl = y - f_y+mean(f_y);
figure,subplot(2,1,1),plot(t1,y),
hold on
plot(t1,f_y,'r-','LineWidth',2)
set(gca,'FontSize',15)
xlabel('Time (s)')
ylabel('F')
title('Raw data')
subplot(2,1,2)
plot(t1,dt_ecgnl)
set(gca,'FontSize',15)
title('Baseline correction')
xlabel('Time (s)')
ylabel('F')


