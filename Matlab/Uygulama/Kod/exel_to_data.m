%% Exel okuma
clear all; clear ;clc;
cd ../../Dataset
xlsread("S_Data.xlsx");
Data=ans;
clearvars ans;
%% Kayıt
cd ../Uygulama/Data/Ham
save('Data.mat');       % Veri kaydetme
cd ../../Kod          % Uygulama/Kod dosyasına dönme