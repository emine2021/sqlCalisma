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
     /* -----------------------------------------------------------------------------
  ORNEK1: MART VE N�SAN aylar�nda ayn� URUN_ID ile sat�lan �r�nlerin
  URUN_ID�lerini listeleyen ve ayn� zamanda bu �r�nleri MART ay�nda alan
  MUSTERI_ISIM 'lerini listeleyen bir sorgu yaz�n�z. 
 -----------------------------------------------------------------------------*/   
 select musteri_isim,urun_id from mart_sat�slar where ex�sts 
 (select urun_id from nisan_sat�slar where mart_sat�slar.urun_id=urun_id);
 --�n ile yap�m�
 select musteri_isim,urun_id from mart_sat�slar where urun_id �n              --daha yava� �al���r
 (select urun_id from nisan_sat�slar where mart_sat�slar.urun_id=urun_id);
  /* -----------------------------------------------------------------------------
  ORNEK2: Her iki ayda da sat�lan �r�nlerin URUN_ISIM'lerini ve bu �r�nleri
  N�SAN ay�nda sat�n alan MUSTERI_ISIM'lerini listeleyen bir sorgu yaz�n�z. 
 -----------------------------------------------------------------------------*/
 -- bir sorgu i�erisinde tabloya k�sa isim vermek m�mk�n
 --tablo_adi k�sa isim
 select urun_isim,musteri_isim from nisan_sat�slar n where ex�sts
 (select urun_isim from mart_sat�slar m where n.urun_isim=m.urun_isim);
  /* ----------------------------------------------------------------------------
  ORNEK3: Her iki ayda da ortak olarak sat�lmayan �r�nlerin URUN_ISIM'lerini 
  ve bu �r�nleri N�SAN ay�nda sat�n alan MUSTERI_ISIM'lerini listeleyiniz. 
 -----------------------------------------------------------------------------*/
 select urun_isim,musteri_isim from nisan_sat�slar n where not ex�sts
 (select urun_isim from mart_sat�slar m where n.urun_isim=m.urun_isim);
 --=============ORDER BY ========================
 CREATE TABLE kisiler 
    (
        ssn char(9) PRIMARY KEY,
        isim VARCHAR2(50), 
        soyisim VARCHAR2(50), 
        maas NUMBER,
        adres VARCHAR2(50) 
    );
    
    INSERT INTO kisiler VALUES(123456789, 'Ali','Can', 3000,'Istanbul');
    INSERT INTO kisiler VALUES(234567890, 'Veli','Cem', 2890,'Ankara');
    INSERT INTO kisiler VALUES(345678901, 'Mine','Bulut',4200,'Ankara');
    INSERT INTO kisiler VALUES(256789012, 'Mahmut','Bulut',3150,'Istanbul');
    INSERT INTO kisiler VALUES (344678901, 'Mine','Yasa', 5000,'Ankara');
    INSERT INTO kisiler VALUES (345458901, 'Veli','Yilmaz',7000,'Istanbul');
    SELECT * FROM kisiler;
    select * from kisiler order by adres;
    select * from kisiler order by maas desc;
    select * from kisiler WHERE isim='Mine' order by ssn desc ;
    /* ----------------------------------------------------------------------------
  ORNEK1: MAAޒ� en y�ksek 3 ki�inin bilgilerini listeleyen sorguyu yaz�n�z.
-----------------------------------------------------------------------------*/
    select * from kisiler order by maas desc fetch next 3 rows only;
    select * from kisiler order by maas desc offset 3 rows fetch NEXT 3 rows only;
    
    CREATE TABLE manav 
    (
        isim varchar2(50), 
        urun_adi varchar2(50), 
        urun_miktari number(9) 
    );
    
    INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
    INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
    INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
    INSERT INTO manav VALUES( 'Veli', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
    INSERT INTO manav VALUES( 'Ayse', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', '', 2);
    /* -----------------------------------------------------------------------------
  ORNEK1: kisi ismine g�re sat�lan toplam meyve miktarlar�n� g�steren sorguyu
  yaz�n�z.
------------------------------------------------------------------------------*/
select isim,sum(urun_miktar�) from manav group by isim;-- gruplara g�re toplama islemi yapmas�n� sa�l�yor
/* ----------------------------------------------------------------------------
  ORNEK2: sat�lan meyve t�r�ne (urun_adi) g�re urun alan ki�i say�s�n� g�steren
  sorguyu yaz�n�z. NULL olarak girilen meyveyi listelemesin.
-----------------------------------------------------------------------------*/
select urun_adi,count(isim)as kisi_sayisi from manav where urun_adi is not null group by urun_adi order by kisi_sayisi;

    