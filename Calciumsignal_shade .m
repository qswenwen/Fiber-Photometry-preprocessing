%import data and preprocess
tracelength = 1200000;
trace = zeros(6,tracelength);
trace(1,:) = y1(1:tracelength);
trace(2,:) = y2(1:tracelength);
trace(3,:) = y3(1:tracelength);
trace(4,:) = y4(1:tracelength);
trace(5,:) = y5(1:tracelength);
trace(6,:) = y6(1:tracelength);
%comment out these line if you dont need to import

y=resample(traces',1,100)'; %raw sampling rate is too high for Calsium imaing, down sampling by 100
x=1:length(y);;
average=mean(y); %mean
upper=average+std(y); %upper bound
lower=average-std(y); %lower bound

figure;shade(x,upper,x,lower,'FillType',[1 2;2 1],'FillColor',[0.5 0.4 0.3],'FillAlpha',0.2); %put shade.m in your matlab working directory. 
set(get(gca,'Children'),'LineStyle','none'); %remove the line of boundaries
hold on;plot(average,'Color', [0.3 0.4 0.5], 'LineWidth',2);