%% Eğitim ve Test Verilerinin Ayarlanması
ornekyuzde=20;
[Egitim, Egitimc, Test, Testc] = Orneklem(Data,ornekyuzde);
    %% Model Eğitme
    regressionGP = fitrgp(...
    Egitim, ...
    Egitimc, ...
    'BasisFunction', 'constant', ...
    'KernelFunction', 'matern52', ...
    'Standardize', true);
    %% Eğitimin Kontrol Edilmesi
    Egitims=predict(regressionGP,Egitim);
    PDK_E=Perf(Egitimc, Egitims);
     E_Dogruluk=Perform(Egitimc, Egitims);
    %% Testin Kontrol Edilmesi
    Tests=predict(regressionGP,Test);
    PDK_T=Perf(Testc,Tests);
    T_Dogruluk=Perform(Testc, Tests);
    %% Verilerin Kaydedilmesi
    cd ..\Data\regressionGP
    save('GP_Data.mat');       % Veri kaydetme
    cd ..\..\Kod          % Uygulama/Kod dosyasına dönme    