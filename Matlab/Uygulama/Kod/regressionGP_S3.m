%% Örnek ve Verileri Çekme İşlemi
clear all; clear ;clc;
cd ..\Data\Eg
load('Eg.mat');       
Eg=Data;
cd ..\regressionGP
load('GP_Data.mat');
cd ..\..\Kod
%% Tahmin İşlemi
  Eg_s=predict(regressionGP,Eg);
    if round(Eg_s)==1
      fprintf("Oltu Taşı")
    end
    if round(Eg_s)==2
      fprintf("Rus Taşı")
    end