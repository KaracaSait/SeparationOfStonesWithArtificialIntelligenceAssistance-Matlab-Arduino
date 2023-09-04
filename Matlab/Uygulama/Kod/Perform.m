function Dogruluk=Perform(Egitimc, Egitims)
Sayi = length(Egitimc);
    Cevaplar = [Egitimc Egitims];
    %% Performans Değerlendirme
    Yanlis=sum(abs(Cevaplar(:,1)-Cevaplar(:,2)));
    Dogruluk=(Sayi-Yanlis)/Sayi*100;
end