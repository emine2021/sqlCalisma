create table sehirler
(
    alan_kodu NUMBER(3)DEFAULT 34,
    isim VARCHAR2(20) DEFAULT 'ISTANBUL',
    nufus NUMBER(8) CHECK(nufus>0) -- check in devamýna default ile devam edilmez kabul etmez
);
DROP TABLE sehirler;
INSERT INTO sehýrler VALUES(54, 'SAKARYA', 1250000);
--parçalý veri giriþi yaparak default deðerlerin atanmasýný saðlayabilirsiin
INSERT INTO sehýrler (nufus) VALUES(1800000);

SELECT * FROM sehirler;
CREATE TABLE ogrenciler
(
    id NUMBER(9),
    isim VARCHAR2(50),
    adres VARCHAR2(100),
    sinav_notu number(3)
);
INSERT INTO ogrenciler VALUES (123,'ALÝ CAN', 'ANKARA',75);
INSERT INTO ogrenciler VALUES (124,'MERVE GUL', 'ANKARA',85);
INSERT INTO ogrenciler VALUES (125,'KEMAL YASA', 'ISTANBUL',85);
SELECT * FROM ogrencýler;
--NOTU 80 DEN BÜYÜK OLANLARI LÝSTELE
SELECT * FROM ogrencýler
WHERE sýnav_notu>80;
-- SADECE ÝSÝM VE NOT SUTUNUNU GÖSTER
SELECT isim,sinav_notu
from ogrencýler
WHERE sinav_notu>80; --koþul yazýyorsun

--yaþadýðý þehir ankara olanlar
select isim,adres
from ogrencýler
where adres='ANKARA';
-------------------------------------------------------------
CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );

    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES( '10002', 'Mehmet Yýlmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ayþe Can', 4000);
    
    --ÝD 10002 ÝLE 10005 OLAN PERSONELÝN TÜM BÝLGÝLERÝNÝ LÝSTELE
    SELECT * FROM personel WHERE id>='10002' AND id<='10005';
    SELECT id, isim
    from personel
    where id between '10002' and '10005';
    --mehmet yýlmaz ile veli han arasýndki personel listele
    select * from personel
    where isim between 'Mehmet Yýlmaz' and 'Veli Han';
    
    --id si 10002 ile 10004 arasýnda olmayanlarý listele
    SELECT * from personel where id not between '10002' and '10004';
    
    --10001,10002 ve 10004 olaný listele
    select * from personel where id IN ('10001','10002','10004');
    SELECT * FROM personel WHERE maas IN (7000,12000);
    --============LÝKE PATTERN================
    select * from personel where isim like '_______';
    --2.harfi e olanlarý listele
    select * from personel where isim like '_e%';
    --maaþýnýn son iki hanesi 00 olan larý listele
    select * from personel where maas like '%00';
    --1.harfi a ve 7.harfi a olan
     select * from personel where isim like 'A_____a%';
     --maaþý 4 basamaklý olmayanlar
      select * from personel where maas not like '____';
      --=======REGEXP_LÝKE==============
      --DAHA KARMAÞIK PATTERN ÝLE SORGULAMA ÝÞLEMÝ ÝÇÝN KULLANILIR
      --REGEXP_LÝKE(SUTUN_ADI, 'PATTERN[] ', 'C'])
      CREATE TABLE kelimeler
    (
        id NUMBER(10) UNIQUE,
        kelime VARCHAR2(50) NOT NULL,
        harf_sayisi NUMBER(6)
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    SELECT * FROM kelýmeler;
    --ÝÇERÝSÝNDE HÝ GEÇEN KELÝMELERÝ GÖSTER
    SELECT * FROM kelimeler WHERE REGEXP_LIKE (kelime, '[hi]'); -- içerisinde herhangi yerde h veya i bulunan kelimeler demek
    SELECT * FROM kelimeler WHERE REGEXP_LIKE (kelime, 'hi');--içerinsinde hi geçen kelimeler
    --içerisinde ot veya at harfleri olan kelimeler
    SELECT * FROM kelimeler WHERE REGEXP_LIKE (kelime, 'ot|at', 'i'); -- | veya demek, 'i' incase sensitive aramak için
    -- hi veya ho ile baþlayan kelimeler
    SELECT * FROM kelimeler WHERE REGEXP_LIKE (kelime, '^hi|^ho','i'); -- baþlama operatoru '^'
    --bitiþ için $ iþareti kullanýlýr
    --t veya m ile biten kelimeler
    SELECT * FROM kelimeler WHERE REGEXP_LIKE (kelime, 't$|m$', 'i');
    --h ile baþlayýp t ile biten 3 harfli kelimeler
    SELECT * FROM kelimeler WHERE REGEXP_LIKE (kelime, '^h[a-z0-9]t$', 'i'); -- '-' karakteri aralýk verir
    --ilk harfi h son harfi t olup 2.harfi a veya i olan 3 harfli kelimeler
    SELECT * FROM kelimeler WHERE REGEXP_LIKE (kelime, '^h[ai]t$', 'i');
    SELECT * FROM kelimeler WHERE REGEXP_LIKE (kelime, '[mie]', 'i');
    --içerisinde en az 2 adet o barýndýran kelimeleri listele
    --{2}
    SELECT * FROM kelimeler WHERE REGEXP_LIKE (kelime, 'o{2}', 'i');
    
    
    
    
    
    






