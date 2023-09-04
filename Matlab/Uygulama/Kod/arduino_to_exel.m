delete(instrfindall);
clear all; clc; close all;
s = serial('COM4','BaudRate',9600);
set(s,'BaudRate', 9600);
set(s,'DataBits', 8);
set(s,'StopBits', 1);
fopen(s);
s.ReadAsyncMode = 'continuous';
numberOfData = 120;
data = zeros(1, numberOfData);
readasync(s);
for x=1:10
for i=1:numberOfData
      data(i) = fscanf(s, '%f');
      fprintf("Data Analyzing...%d\n",i)
      A(x,i)=[data(i)];
      xlswrite("r1_15",A);
      i=i+1;
end
     fprintf("Data Received--->%d\n",x)
end
     xlswrite("r1_15",2,"DQ1:DQ10");  % First 300  -> Oltu Taşı
   %  xlswrite("kutu1",2,"DQ301:DQ600"); % Last 300  -> Rus Taşı
fclose(s);
delete(s);
clear s;