[filename pathname] = uigetfile('*.xlsx');
[num,txt,raw] = xlsread([pathname filename],2);
%%
figure,
plot(num(:,3))
%%
data_channels = num;

%%
begin_points = 10000;  % ???
channel = 3;         %???
y = data_channels(begin_points:end,channel);
Fs = 2000;
time=(1:length(y))/Fs;
t1=(1:length(y))/Fs;

% polyfit
frame=(1:length(y))';   % 
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
%%
minpeakheight = 135;  % ??
min_distance = 500;    %????
%
figure,
plot(dt_ecgnl);      
[pks,locs] = findpeaks(dt_ecgnl,'MinPeakHeight',minpeakheight,'MinPeakDistance',min_distance);  % 
hold on;
scatter(locs,dt_ecgnl(locs));
title(['number of spikes:',sprintf('%d',length(locs))]);
