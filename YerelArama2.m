function [sonucbesin,sonuccozumdegeri]=YerelArama2(besin,cozumdegeri,ilmesafe,sehirsayisi)
sonucbesin=besin;
sonuccozumdegeri=cozumdegeri;
for i=1:lengt(sonucbesin)-1
    for j=1:length(sonucbesin)
        yenibesin=diziyiterscevir(sonucbesin,1,j);
        yeniamacfonksiyonu=amacfonksiyonu(yenibesin,ilmesafe,sehirsayisi);
        if yeniamacfonksiyonu<sonuccozumdegeri
            sonuccozumdegeri=yeniamacfonksiyonu;
            sonucbesin=yenibesin;
        end
    end
end