%% Exel okuma
clear all; clear ;clc;
xlsread("Eg.xls");
Data=ans;
clearvars ans;
%% Kayıt
cd ..\Data\Eg
save('Eg.mat');       % Veri kaydetme
cd ..\..\Kod          % Uygulama/Kod dosyasına dönme