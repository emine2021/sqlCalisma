create table sehirler
(
    alan_kodu NUMBER(3)DEFAULT 34,
    isim VARCHAR2(20) DEFAULT 'ISTANBUL',
    nufus NUMBER(8) CHECK(nufus>0) -- check in devam�na default ile devam edilmez kabul etmez
);
DROP TABLE sehirler;
INSERT INTO seh�rler VALUES(54, 'SAKARYA', 1250000);
--par�al� veri giri�i yaparak default de�erlerin atanmas�n� sa�layabilirsiin
INSERT INTO seh�rler (nufus) VALUES(1800000);

SELECT * FROM sehirler;
CREATE TABLE ogrenciler
(
    id NUMBER(9),
    isim VARCHAR2(50),
    adres VARCHAR2(100),
    sinav_notu number(3)
);
INSERT INTO ogrenciler VALUES (123,'AL� CAN', 'ANKARA',75);
INSERT INTO ogrenciler VALUES (124,'MERVE GUL', 'ANKARA',85);
INSERT INTO ogrenciler VALUES (125,'KEMAL YASA', 'ISTANBUL',85);
SELECT * FROM ogrenc�ler;
--NOTU 80 DEN B�Y�K OLANLARI L�STELE
SELECT * FROM ogrenc�ler
WHERE s�nav_notu>80;
-- SADECE �S�M VE NOT SUTUNUNU G�STER
SELECT isim,sinav_notu
from ogrenc�ler
WHERE sinav_notu>80; --ko�ul yaz�yorsun

--ya�ad��� �ehir ankara olanlar
select isim,adres
from ogrenc�ler
where adres='ANKARA';
-------------------------------------------------------------
CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );

    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES( '10002', 'Mehmet Y�lmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ay�e Can', 4000);
    
    --�D 10002 �LE 10005 OLAN PERSONEL�N T�M B�LG�LER�N� L�STELE
    SELECT * FROM personel WHERE id>='10002' AND id<='10005';
    SELECT id, isim
    from personel
    where id between '10002' and '10005';
    --mehmet y�lmaz ile veli han aras�ndki personel listele
    select * from personel
    where isim between 'Mehmet Y�lmaz' and 'Veli Han';
    
    --id si 10002 ile 10004 aras�nda olmayanlar� listele
    SELECT * from personel where id not between '10002' and '10004';
    
    --10001,10002 ve 10004 olan� listele
    select * from personel where id IN ('10001','10002','10004');
    SELECT * FROM personel WHERE maas IN (7000,12000);
    --============L�KE PATTERN================
    select * from personel where isim like '_______';
    --2.harfi e olanlar� listele
    select * from personel where isim like '_e%';
    --maa��n�n son iki hanesi 00 olan lar� listele
    select * from personel where maas like '%00';
    --1.harfi a ve 7.harfi a olan
     select * from personel where isim like 'A_____a%';
     --maa�� 4 basamakl� olmayanlar
      select * from personel where maas not like '____';
      --=======REGEXP_L�KE==============
      --DAHA KARMA�IK PATTERN �LE SORGULAMA ��LEM� ���N KULLANILIR
      --REGEXP_L�KE(SUTUN_ADI, 'PATTERN[] ', 'C'])
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
    SELECT * FROM kel�meler;
    --��ER�S�NDE H� GE�EN KEL�MELER� G�STER
    SELECT * FROM kelimeler WHERE REGEXP_LIKE (kelime, '[hi]'); -- i�erisinde herhangi yerde h veya i bulunan kelimeler demek
    SELECT * FROM kelimeler WHERE REGEXP_LIKE (kelime, 'hi');--i�erinsinde hi ge�en kelimeler
    --i�erisinde ot veya at harfleri olan kelimeler
    SELECT * FROM kelimeler WHERE REGEXP_LIKE (kelime, 'ot|at', 'i'); -- | veya demek, 'i' incase sensitive aramak i�in
    -- hi veya ho ile ba�layan kelimeler
    SELECT * FROM kelimeler WHERE REGEXP_LIKE (kelime, '^hi|^ho','i'); -- ba�lama operatoru '^'
    --biti� i�in $ i�areti kullan�l�r
    --t veya m ile biten kelimeler
    SELECT * FROM kelimeler WHERE REGEXP_LIKE (kelime, 't$|m$', 'i');
    --h ile ba�lay�p t ile biten 3 harfli kelimeler
    SELECT * FROM kelimeler WHERE REGEXP_LIKE (kelime, '^h[a-z0-9]t$', 'i'); -- '-' karakteri aral�k verir
    --ilk harfi h son harfi t olup 2.harfi a veya i olan 3 harfli kelimeler
    SELECT * FROM kelimeler WHERE REGEXP_LIKE (kelime, '^h[ai]t$', 'i');
    SELECT * FROM kelimeler WHERE REGEXP_LIKE (kelime, '[mie]', 'i');
    --i�erisinde en az 2 adet o bar�nd�ran kelimeleri listele
    --{2}
    SELECT * FROM kelimeler WHERE REGEXP_LIKE (kelime, 'o{2}', 'i');
    
    
    
    
    
    






