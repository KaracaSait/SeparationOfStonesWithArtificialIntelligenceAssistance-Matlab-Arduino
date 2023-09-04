delete(instrfindall);
clear all; clc; close all;
s = serial('COM4','BaudRate',9600);
set(s,'BaudRate', 9600);
set(s,'DataBits', 8);
set(s,'StopBits', 1);
fopen(s);
s.ReadAsyncMode = 'continuous';
numberOfData = 120;
%% Grafik İşlemi
figure(1);
hold on;
grid on;
title('Arduino Freq Data');
xlabel('Sample');
ylabel('Hz');
%% Örnek Alma İşlemleri
data = zeros(1, numberOfData);
readasync(s);
for i=1:numberOfData
%     tic
      data(i) = fscanf(s, '%f');
      fprintf("Data Analyzing...%d\n",i)
      A(1,i)=[data(i)];
      %% Grafik İşlemleri
      plot(i, data(i), '-b*'); 
      drawnow;
      %%
      xlswrite("Eg",A);
      i=i+1;
%       toc
end
fclose(s);
delete(s);
clear s;
%% Exel okuma
clear all; clear ;clc;
xlsread("Eg.xls");
Data=ans;
clearvars ans;
%% Kayıt
cd ..\Data\Eg
save('Eg.mat');       % Veri kaydetme
cd ..\..\Kod         
%% Örnek ve Verileri Çekme İşlemi
clear all; clear ;clc;
cd ..\Data\Eg
load('Eg.mat');       
Eg=Data;
cd ..\Kernel
load('Kernel_Data.mat');
cd ..\..\Kod
%% Tahmin İşlemi
  Eg_s_Kernel=predict(Kernel,Eg);
    if Eg_s_Kernel == 1
        cd ..\Data\KNN
        load('KNN_Data.mat');
        cd ..\..\Kod
         Eg_s_KNN =predict(KNN,Eg);
         if Eg_s_KNN == 1
          fprintf("Oltu Taşı")
         end
         if Eg_s_KNN == 2
            fprintf("Lütfen Tekrar Ölçüm Yapınız")
         end
    end
%     cd ..\Data\Kernel
%     load('Kernel_Data.mat');
%     cd ..\..\Kod
    if Eg_s_Kernel == 2
        cd ..\Data\KNN
        load('KNN_Data.mat');
        cd ..\..\Kod
         Eg_s_KNN=predict(KNN,Eg);
         if Eg_s_KNN == 1
          fprintf("Lütfen Tekrar Ölçüm Yapınız")
         end
         if Eg_s_KNN == 2
            fprintf("Rus Taşı")
         end
    end