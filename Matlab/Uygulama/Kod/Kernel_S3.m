%% Örnek ve Verileri Çekme İşlemi
clear all; clear ;clc;
cd ..\Data\Eg
load('Eg.mat');       
Eg=Data;
cd ..\Kernel
load('Kernel_Data.mat');
cd ..\..\Kod
%% Tahmin İşlemi
  Eg_s=predict(Kernel,Eg);
    if Eg_s == 1
      fprintf("Oltu Taşı")
    end
    if Eg_s == 2
      fprintf("Rus Taşı")
    end