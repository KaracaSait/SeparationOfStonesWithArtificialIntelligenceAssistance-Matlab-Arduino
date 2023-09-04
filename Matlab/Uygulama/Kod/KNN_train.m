%% Eğitim ve Test Verilerinin Ayarlanması
ornekyuzde=20;
[Egitim, Egitimc, Test, Testc,] = Orneklem(Data,ornekyuzde);
%% KNN Model Eğitme
subspaceDimension = max(1, min(60, width(Egitim) - 1));
KNN = fitcensemble(...
    Egitim, ...
    Egitimc, ...
    'Method', 'Subspace', ...
    'NumLearningCycles', 30, ...
    'Learners', 'knn', ...
    'NPredToSample', subspaceDimension, ...
    'ClassNames', [1; 2]);
    %% Eğitimin Kontrol Edilmesi
    Egitims=predict(KNN,Egitim);
%     PDK_E=Perf(Egitimc, Egitims);
    E_Dogruluk_KNN=Perform(Egitimc, Egitims);
    %% Testin Kontrol Edilmesi
    Tests=predict(KNN,Test);
%     PDK_T=Perf(Testc,Tests);
    T_Dogruluk_KNN=Perform(Testc, Tests);
    %% Verilerin Kaydedilmesi
    cd ../Data/KNN
    save('KNN_Data.mat');       % Veri kaydetme
    cd ../../Kod          % Uygulama/Kod dosyasına dönme    