
/*============================== JOIN ÝSLEMLERÝ ===============================
    
    Set Operatorleri (Union,Intersect,Minus) farklý tablolardaki sutunlari 
    birlestirmek kullanilir.
    
    Join islemleri ise farklý Tablolari birlestirmek icin kullanilir. Diger 
    bir ifade ile farkli tablolardaki secilen sutunlar ile yeni bir tablo 
    olusturmak icin kullanilabilir.
    
    JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
    Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
    icin JOIN islemleri kullanilabilir.
    
    ORACLE SQL'de 4 Cesit Join isemi kullanilabilmektedir.
    1) FULL JOIN:  Tablodaki tum sonuclari gosterir
    2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
    3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
    4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir
   
==============================================================================*/   
    CREATE TABLE sirketler 
    (
        sirket_id NUMBER(9), 
        sirket_isim VARCHAR2(20)
    );
    
    INSERT INTO sirketler VALUES(100, 'Toyota');
    INSERT INTO sirketler VALUES(101, 'Honda');
    INSERT INTO sirketler VALUES(102, 'Ford');
    INSERT INTO sirketler VALUES(103, 'Hyundai');
    
    CREATE TABLE siparisler
    (
        siparis_id NUMBER(9),
        sirket_id NUMBER(9), 
        siparis_tarihi DATE
    );
    
    INSERT INTO siparisler VALUES(11, 101, '17/04/2020');
    INSERT INTO siparisler VALUES(22, 102, '18/04/2020');
    INSERT INTO siparisler VALUES(33, 103, '19/04/2020');
    INSERT INTO siparisler VALUES(44, 104, '20/04/2020');
    INSERT INTO siparisler VALUES(55, 105, '21/04/2020');
?
    SELECT * FROM siparisler;
    SELECT * FROM sirketler;
    /*=============================== FULL JOIN  ==================================
    
    FULL JOIN, Her iki tablo icin secilen sutunlara ait olan tum satirlari 
    getirmek icin kullanilir. 
    
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 
    FULL JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
?
==============================================================================*/   
   
/* -----------------------------------------------------------------------------
  ORNEK1: sirketler ve siparisler adýndaki tablolarda yer alan sirket_isim, 
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/
select s.sirket_isim, sp.siparis_id, sp.siparis_tarihi from sirketler s full joýn siparisler sp on sp.sirket_id=s.sirket_id;
--full join de iki tabloda var olan tum satýrlar gosterilir
--birinde olupda diðerinde olmayan alanlar bos býrakýldý
--join isleminde genelde iki tablodaki ortak olarak bulunan sutun, on cumleciðinde koþul yapýsý olarak kullanýlýr.

/*=============================== INNER JOIN  ==================================
   
    Iki tablonun kesisim kumesi ile yeni bir tablo olusturmak icin kullanilir.
   
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1
    INNER JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
================================================================================ 
   
 
/* -----------------------------------------------------------------------------
  ORNEK2: Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
  siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/
select sirket_isim,siparis_id,siparis_tarihi,sp.sirket_id from sirketler s 
ýnner join siparisler sp on sp.sirket_id=s.sirket_id;

--ýnner join sadeve iki tablodaki ortak olan satýrlar seçilir
--diðer ifade ile iki tablodaki ortak olan sirket_id deðerleri için ilgili sutunlar listelenir
--ýnner anahtar kelimesi opsiyoneldir.

/*=============================== LEFT JOIN  ==================================
   
    LEFT JOIN, 1. tablodan (sol tablo) SELECT ile ifade edilen sutunlara ait tum
    satirlari getirir.
    Ancak, diger tablodan sadece ON ile belirtilen kosula uyan satirlari getirir.
       
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1
    LEFT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/
/* -----------------------------------------------------------------------------
  ORNEK3: sirketler tablosundaki tum sirketleri ve bu sirketlere ait olan
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/
select sirket_isim,siparis_id,siparis_tarihi,sp.sirket_id from sirketler s 
left joýn siparisler sp on sp.sirket_id=s.sirket_id;

/*=============================== RIGHT JOIN  ==================================
   
    RIGHT JOIN, 2. tablodan (sag tablo) SELECT ile ifade edilen sutunlara ait tum
    satirlari getirir.
    Ancak, diger tablodan sadece ON ile belirtilen kosula uyan satirlari getirir.
       
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1
    RIGHT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/
/* -----------------------------------------------------------------------------
  ORNEK4: siparisler tablosundaki tum siparis_id ve siparis_tarihleri ile
  bunlara karþýlýk gelen sirket_isimlerini listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/
select sirket_isim,siparis_id,siparis_tarihi,sp.sirket_id from sirketler s 
right joýn siparisler sp on sp.sirket_id=s.sirket_id;
/*=============================== ALTER TABLE ==================================
   
    ALTER TABLE  tabloda ADD, MODIFY, veya DROP/DELETE COLUMNS islemleri icin
    kullanilir.
   
    ALTER TABLE ifadesi tablolari yeniden isimlendirmek (RENAME) icin de
    kullanilir.
  
==============================================================================*/
CREATE TABLE personel 
    (
        id NUMBER(9), 
        isim VARCHAR2(50), 
        sehir VARCHAR2(50), 
        maas NUMBER(20), 
        sirket VARCHAR2(20),
        CONSTRAINT personel_pk PRIMARY KEY (id)
    );
?
?
    INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
    INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
    INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
    INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
    INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
    INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
    INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
    /* -----------------------------------------------------------------------------
  ORNEK1: personel tablosuna ulke_isim adinda ve default degeri ‘Turkiye’ olan
  yeni bir sutun ekleyiniz.
------------------------------------------------------------------------------*/
alter table personel add ulke_isim varchar2(20) default 'Turkiye';
alter table personel drop column ulke_isim;
select * from personel;
/* -----------------------------------------------------------------------------
  ORNEK2: personel tablosuna cinsiyet Varchar2(20) ve yas Number(3) seklinde 
  yeni sutunlar ekleyiniz.
------------------------------------------------------------------------------*/  
    ALTER TABLE personel
    ADD (cinsiyet VARCHAR2(20), yas NUMBER(3));
/* -----------------------------------------------------------------------------
  ORNEK3: personel tablosundan yas sutununu siliniz.
------------------------------------------------------------------------------*/
alter table personel drop column yas;
/* -----------------------------------------------------------------------------
  ORNEK4: personel tablosundaki ulke_isim sutununun adýný ulke_adi olarak deðiþtiriniz.
------------------------------------------------------------------------------*/
alter table personel rename column ulke_isim to ulke_adi;
/* -----------------------------------------------------------------------------
  ORNEK5: personel tablosunun adini isciler olarak degistiriniz.
------------------------------------------------------------------------------*/
alter table personel rename to isciler;
select * from isciler;
delete from isciler where isim='Veli Sahin';  -- satýr silme
/* -----------------------------------------------------------------------------
  ORNEK6: isciler tablosundaki ulke_adi sutununa NOT NULL kisitlamasi ekleyiniz.
------------------------------------------------------------------------------*/
alter table isciler MODIFY ulke_adi varchar2(30) not null;
alter table isciler modýfy isim char(100);
ALTER TABLE isciler
MODIFY maas CHECK (maas >= 3500);
INSERT INTO isciler VALUES(123456729, 'Hatice Sahin', 'Bursa', 2500, 'Honda');



