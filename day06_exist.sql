/*=========================== EXISTS, NOT EXIST ================================
    EXISTS operatorü bir Boolean operatördür ve true - false deðer döndürür. 
    EXISTS operatorü sýklýkla Subquery'lerde satýrlarýn doðruluðunu test etmek 
    için kullanýlýr.
    
    Eðer bir subquery (altsorgu) bir satýrý döndürürse EXIST operatörü de TRUE 
    deðer döndürür. Aksi takdirde, FALSE deðer döndürecektir.
    
    Özellikle altsorgularda hýzlý kontrol iþlemi gerçekleþtirmek için kullanýlýr
==============================================================================*/
CREATE TABLE mart_satislar 
    (
        urun_id number(10),
        musteri_isim varchar2(50), 
        urun_isim varchar2(50)
    );
    
    CREATE TABLE nisan_satislar 
    (
        urun_id number(10),
        musteri_isim varchar2(50), 
        urun_isim varchar2(50)
    );
    
    INSERT INTO mart_satislar VALUES (10, 'Mark', 'Honda');
    INSERT INTO mart_satislar VALUES (10, 'Mark', 'Honda');
    INSERT INTO mart_satislar VALUES (20, 'John', 'Toyota');
    INSERT INTO mart_satislar VALUES (30, 'Amy', 'Ford');
    INSERT INTO mart_satislar VALUES (20, 'Mark', 'Toyota');
    INSERT INTO mart_satislar VALUES (10, 'Adem', 'Honda');
    INSERT INTO mart_satislar VALUES (40, 'John', 'Hyundai');
    INSERT INTO mart_satislar VALUES (20, 'Eddie', 'Toyota');
    
    
    INSERT INTO nisan_satislar VALUES (10, 'Hasan', 'Honda');
    INSERT INTO nisan_satislar VALUES (10, 'Kemal', 'Honda');
    INSERT INTO nisan_satislar VALUES (20, 'Ayse', 'Toyota');
    INSERT INTO nisan_satislar VALUES (50, 'Yasar', 'Volvo');
    INSERT INTO nisan_satislar VALUES (20, 'Mine', 'Toyota');

    SELECT * FROM mart_satislar;
    SELECT * FROM nisan_satislar;
    --DELETE FROM nisan_satislar;
    /* -----------------------------------------------------------------------------
  ORNEK1: MART VE NÝSAN aylarýnda ayný URUN_ID ile satýlan ürünlerin
  URUN_ID’lerini listeleyen ve ayný zamanda bu ürünleri MART ayýnda alan
  MUSTERI_ISIM 'lerini listeleyen bir sorgu yazýnýz. 
 -----------------------------------------------------------------------------*/       
    -- tablolara kýsa isim vermek mümkündür. Böylece sorgularýmýzýn daha kýsa 
    -- gözükmesini saðlabiliriz.
    --AS bir sutuna kýsa isim veriyor
    --Bir sorguu içerisinde tabloyada kýsa bir isim verdik
    select musteri_isim from mart_satislar m where exists
    (select urun_id from nisan_satislar n where m.urun_id=urun_id);
    -- ýn ile de yapabilirdik
    select musteri_isim from mart_satislar where urun_id ýn
    (select urun_id from nisan_satislar where mart_satislar.urun_id=urun_id);
    
    /* -----------------------------------------------------------------------------
  ORNEK2: Her iki ayda da satýlan ürünlerin URUN_ISIM'lerini ve bu ürünleri
  NÝSAN ayýnda satýn alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazýnýz. 
 -----------------------------------------------------------------------------*/
 select musteri_isim,urun_isim from nisan_satislar where exists
 (select urun_isim from mart_satislar where urun_isim=nisan_satislar.urun_isim);
 
 /* ----------------------------------------------------------------------------
  ORNEK3: Her iki ayda da ortak olarak satýlmayan ürünlerin URUN_ISIM'lerini 
  ve bu ürünleri NÝSAN ayýnda satýn alan MUSTERI_ISIM'lerini listeleyiniz. 
 -----------------------------------------------------------------------------*/
    select urun_isim musteri_isim from nisan_satislar where not exists 
    (select urun_isim from mart_satislar where urun_isim=nisan_satislar.urun_isim); 
    
    