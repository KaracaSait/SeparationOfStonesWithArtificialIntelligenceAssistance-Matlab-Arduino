%% Örnek ve Verileri Çekme İşlemi
clear all; clear ;clc;
cd ..\Data\Eg
load('Eg.mat');       
Eg=Data;
cd ..\KNN
load('KNN_Data.mat');
cd ..\..\Kod
%% Tahmin İşlemi
  Eg_s=predict(KNN,Eg);
    if Eg_s == 1
      fprintf("Oltu Taşı")
    end
    if Eg_s == 2
      fprintf("Rus Taşı")
    end