 CREATE TABLE tekrar_talebe
    (
        id CHAR(3),
        isim VARCHAR2(50),
        veli_isim VARCHAR2(50),
        yazili_notu NUMBER(3),
        CONSTRAINT tekrar_talebe_pk PRIMARY KEY (id)
    );
    
    INSERT INTO tekrar_talebe VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO tekrar_talebe VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO tekrar_talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO tekrar_talebe VALUES(126, 'Nesibe Y�lmaz', 'Ayse',95);
	INSERT INTO tekrar_talebe VALUES(127, 'Mustafa Bak', 'Can',99);
    
    CREATE TABLE tekrar_notlar 
    ( 
        talebe_id char(3), 
        ders_adi varchar2(30), 
        yazili_notu number (3), 
        CONSTRAINT tekrar_notlar_fk FOREIGN KEY (talebe_id) 
        REFERENCES tekrar_talebe(id)ON DELETE CASCADE  --denirse child da silmeden parent da silme yapabilirsin childda da silinir
        );                                             --ili�ki bulunan tablolarda silme yapma i�in kullan�l�r
    select * from tekrar_notlar;
    select * from tekrar_talebe;
    delete from tekrar_notlar where talebe_id=124; -- �nce child sonra parent silinmeli yoksa hata bunu engellemek i�in 
    delete from tekrar_talebe where �d=124;        --ON DELETE DESCADE yaz�lmal� child a
    
    INSERT INTO tekrar_notlar VALUES ('123','kimya',75);
    INSERT INTO tekrar_notlar VALUES ('124', 'fizik',65);
    INSERT INTO tekrar_notlar VALUES ('124', 'fizik',75);
    INSERT INTO tekrar_notlar VALUES ('125', 'tarih',90);
	INSERT INTO tekrar_notlar VALUES ('126', 'Matematik',90);
    CREATE TABLE personel 
    (
        id NUMBER(9), 
        isim VARCHAR2(50), 
        sehir VARCHAR2(50), 
        maas NUMBER(20), 
        sirket VARCHAR2(20)
    );
    INSERT INTO personel VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Honda');
    INSERT INTO personel VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'Toyota');
    INSERT INTO personel VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Honda');
    INSERT INTO personel VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Ford');
    INSERT INTO personel VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Hyundai');
    INSERT INTO personel VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Ford');
    INSERT INTO personel VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Honda');
    
    CREATE TABLE sirketler
    (
        sirket_id NUMBER(9), 
        sirket_adi VARCHAR2(20), 
        personel_sayisi NUMBER(20)
    );
    
    INSERT INTO sirketler VALUES(100, 'Honda', 12000);
    INSERT INTO sirketler VALUES(101, 'Ford', 18000);
    INSERT INTO sirketler VALUES(102, 'Hyundai', 10000);
    INSERT INTO sirketler VALUES(103, 'Toyota', 21000);
    
    /* -----------------------------------------------------------------------------
  ORNEK1: Personel say�s� 15.000�den cok olan sirketlerin isimlerini ve bu
  sirkette calisan personelin isimlerini listeleyin
-----------------------------------------------------------------------------*/
 select isim,sirket,maas from personel where sirket �n(select sirket_adi from sirketler where personel_sayisi>15000);
 /* -----------------------------------------------------------------------------
  ORNEK2: sirket_id�si 101�den b�y�k olan �irket �al��anlar�n�n isim, maa� ve
  �ehirlerini listeleyiniz.
-----------------------------------------------------------------------------*/
select isim,maas,sehir from personel where sirket �n (select sirket_adi from sirketler where sirket_id>101);
/* -----------------------------------------------------------------------------
  ORNEK3:  Ankara�da personeli olan �irketlerin �irket id�lerini ve personel
  say�lar�n� listeleyiniz
-----------------------------------------------------------------------------*/
select sirket_id,personel_sayisi from sirketler where sirket_adi �n (select sirket from personel where sehir='Ankara');
select * from personel;
select * from sirketler;
/* -----------------------------------------------------------------------------
  ORNEK4: Her �irketin ismini, personel say�s�n� ve o �irkete ait personelin
  toplam maa��n� listeleyen bir Sorgu yaz�n�z.
 -------------------------------------------------------------*/
 select sirket_adi, personel_sayisi,(select sum(maas) from personel where sirket=sirket_adi) as toplam_maas from sirketler;
 /* -----------------------------------------------------------------------------
  ORNEK5: Her �irketin ismini, personel say�s�n� ve o �irkete ait personelin
  ortalama maa��n� listeleyen bir Sorgu yaz�n�z.
-----------------------------------------------------------------------------*/
select sirket_adi, personel_sayisi,(select round(avg(maas)) from personel where sirket_adi=sirket) as ort_maas from sirketler;
/* -----------------------------------------------------------------------------
  ORNEK6: Her �irketin ismini, personel say�s�n� ve o �irkete ait personelin
  maks ve minimum maa��n� listeleyen bir Sorgu yaz�n�z.
-----------------------------------------------------------------------------*/
select sirket_adi, personel_sayisi,(select max(maas) from personel where sirket_adi=sirket) as maks_maas,
(select m�n(maas) from personel where sirket_adi=sirket)as min_maas from sirketler;
/* -----------------------------------------------------------------------------
  ORNEK8: Her sirketin id�sini, ismini ve toplam ka� �ehirde bulundu�unu 
  listeleyen bir SORGU yaz�n�z.
 -------------------------------------------------------------------------*/
 select sirket_id, sirket_adi,(select count(sehir) from personel where sirket=sirketler.sirket_adi) 
                               as sehir_sayisi from sirketler;





