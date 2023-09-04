%% Eğitim ve Test Verilerinin Ayarlanması
ornekyuzde=20;
[Egitim, Egitimc, Test, Testc,] = Orneklem(Data,ornekyuzde);
%% Kernel Model Eğitme
isCategoricalPredictor = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];
distributionNames =  repmat({'Kernel'}, 1, length(isCategoricalPredictor));
distributionNames(isCategoricalPredictor) = {'mvmn'};

if any(strcmp(distributionNames,'Kernel'))
    Kernel = fitcnb(...
        Egitim, ...
        Egitimc, ...
        'Kernel', 'Normal', ...
        'Support', 'Unbounded', ...
        'DistributionNames', distributionNames, ...
        'ClassNames', [1; 2]);
else
    Kernel = fitcnb(...
        Egitim, ...
        Egitimc, ...
        'DistributionNames', distributionNames, ...
        'ClassNames', [1; 2]);
end
    %% Eğitimin Kontrol Edilmesi
    Egitims=predict(Kernel,Egitim);
%     PDK_E=Perf(Egitimc, Egitims);
    E_Dogruluk_Kernel=Perform(Egitimc, Egitims);
    %% Testin Kontrol Edilmesi
    Tests=predict(Kernel,Test);
%     PDK_T=Perf(Testc,Tests);
    T_Dogruluk_Kernel=Perform(Testc, Tests);
    %% Verilerin Kaydedilmesi
    cd ../Data/Kernel
    save('Kernel_Data.mat');       % Veri kaydetme
    cd ../../Kod          % Uygulama/Kod dosyasına dönme    