delete(instrfindall);
clear all; clc; close all;
s = serial('COM4','BaudRate',9600);
set(s,'BaudRate', 9600);
set(s,'DataBits', 8);
set(s,'StopBits', 1);
fopen(s);
s.ReadAsyncMode = 'continuous';
numberOfData = 120;
figure(1);
hold on;
grid on;
title('Arduino Freq Data');
xlabel('Sample');
ylabel('Hz');
data = zeros(1, numberOfData);
readasync(s);
for i=1:numberOfData
%     tic
      data(i) = fscanf(s, '%f');
      fprintf("Data Analyzing...%d\n",i)
      A(1,i)=[data(i)];
      plot(i, data(i), '-y*'); 
      drawnow;
      xlswrite("Eg",A);
      i=i+1;
%       toc
end
fclose(s);
delete(s);
clear s;