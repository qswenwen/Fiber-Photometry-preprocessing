[filename pathname] = uigetfile('*.dat');
fid=fopen([pathname filename]); 
data=fread(fid,Inf,'single',0,'ieee-be'); 

data=data(1:end);  
data_chan_len=floor(length(data)/4);
data_channels=reshape(data,4,data_chan_len)';
%%
begin_points = 200;  % ???
y = data_channels(begin_points:end,1);
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
minpeakheight = 0.219;  % ??
min_distance = 5000;    %????
%
figure,
plot(dt_ecgnl);      
[pks,locs] = findpeaks(dt_ecgnl,'MinPeakHeight',minpeakheight,'MinPeakDistance',min_distance);  % 
hold on;
scatter(locs,dt_ecgnl(locs));

