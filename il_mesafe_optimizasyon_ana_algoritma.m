clear all;
clc;
sehirsayisi=81;
isciarisayisi=15;
gozcuarisayisi=15;
besinsayisi=50;
limit=100;
ilmesafe=xlaread('ilmesafe.xls');
eniyicozumdegeri=1000000;
besin=besinmatrisi(besinsayisi,sehirsayisi);
denemesayisi=zero(size(besin(:,1)));
for i=1:besinsayisi
    cozumdegeri(i)=amacfonsiyonu(besin(i,:), ilmesafe, sehirsayisi);
    if eniyicozumdegeri>cozumdegeri(i)
        eniyicozumdegeri=cozumdegeri(i);
        eniyicozum=besin(i,:);
    end
end
for iterasyon=10000
%iþçi arý safasý baþlardý.
for i=1:isciarisayisi
    degisecekbesinno=randi([1 besinsayisi]);
    r=rand(1);
    indis1=randi([1 sehirsayisi]);
    indis2=rand ([1 sehirsayisi]);
    while indis1==indis2
        indis2=randi([1 sehirsayisi]);
    end
    if r<1/3
        yenibesin=yerdegistir(besin(degisecekbesinno,:), indis1, indis2);
    elseif r<2/3
        yenibesin=solakaydir(besin(degisecekbesinno,:), indis1, indis2);
    else
        yenibesin=diziyiterscevir(besin(degisecekbesinno,:), indis1, indis2);
    end
    yenicozumdegeri=amacfonksiyonu(yenibesin,ilmesafe,sehirsayisi);
    if yenicozumdegeri<cozumdegeri(degisecekbesinno)
        cozumdegeri(degisecekbesinno)=yenicozumdegeri;
        besin(degisecekbesinno,:)=yenibesin;
        denemesayisi(degisecekbesinno)=0;
        if eniyicozumdegeri>yenicozumdegeri
            eniyicozumdegeri=yenicozumdegeri;
            eniyicozumdegeri=yenibesin;
        end
    else
        denemesayisi(degisecekbesinno)=denemesayisi(degisecekbesinno)+1;
    end
end
%iþci arý safasý bitti gözcü arý baþladý.
sabit=1;
for i=1:besinsayisi
    miniciuygunluk(i)=sabit/cozumdegeri(i);
end
cozumdegerleritoplami=0;
for i=1:besinsayisi
    cozumdegerleritoplami=cozumdegerleritoplami+miniciuygunluk(i);
end
for i=1:besinsayisi
    uygunluk(i)=miniciuygunluk(i)/cozumdegerleritoplami;
end
for i=1:gozcuarisayisi
    degisecekbesinno=besinsec(uygunluk);
    r=rand(1);
    indis1=randi([1 sehirsayisi]);
    indis2=randi([1 sehirsayisi]);
    while indis1==indis2
        indis2=randi([1 sehirsayisi]);
    end
    if r<1/3
        yenibesin=yerdegistir(besin(degisecekbesinno,:), indis1, indis2);
    elseif r<2/3
        yenibesin=diziyiterscevir(besin(degisecekbesinno,:), indis1, indis2);
    else
        yenibesin=solakaydir(besin(degisecekbesinno,:), indis1, indis2);
    end
        if yenicozumdegeri<cozumdegeri(degisecekbesinno)
        cozumdegeri(degisecekbesinno)=yenicozumdegeri;
        besin(degisecekbesinno,:)=yenibesin;
        denemesayisi(degisecekbesinno)=0;
        if eniyicozumdegeri>yenicozumdegeri
            eniyicozumdegeri=yenicozumdegeri;
            eniyicozumdegeri=yenibesin;
        end
    else
   denemesayisi(degisecekbesinno)=denemesayisi(degisecekbesinno)+1;
        end
end
 %gözcü arý safasý bitti kaþif arý safasý baþldý.
 for i=1:besinsayisi
     if denemesayisi(i)>limit;
         denemesayisi(i)=0;
         [besin(i,:),cozumdegeri(i)]=YerelArama1(besinii,:),cozumdegeri(i),ilmesafe,sehirsayisi);
         if eniyicozumdegeri>cozumdegeri(i)
             eniyicozumdegeri=cozumdegeri(i);
             eniyicozum=besin(i,);
         end
         [besin(i,:),cozumdegeri(i)]=YerelArama2(besinii,:),cozumdegeri(i),ilmesafe,sehirsayisi);
         if eniyicozumdegeri>cozumdegeri(i)
             eniyicozumdegeri=cozumdegeri(i);
             eniyicozum=besin(i,);
         end
     end
 end
 %kaþif arý safasý bitti.
fprintf('iterasyon: %d EniyiCozum: %d \n',iterasyon,eniyicozumdegeri);
end
 
 