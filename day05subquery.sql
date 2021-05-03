/* ============================= SUBQUERIES ====================================
    SORGU içinde çalýþan SORGUYA SUBQUERY (ALT SORGU) denilir.
==============================================================================*/
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

select * FROM sirketler;
SELECT * FROM personel;
* -----------------------------------------------------------------------------
  ORNEK1: Personel sayýsý 15.000’den cok olan sirketlerin isimlerini ve bu
  sirkette calisan personelin isimlerini listeleyin
-----------------------------------------------------------------------------*/
select isim,sirket from personel where sirket IN ( select sirket_adi from sirketler where personel_sayisi>15000);
* -----------------------------------------------------------------------------
  ORNEK2: sirket_id’si 101’den büyük olan þirket çalýþanlarýnýn isim, maaþ ve
  þehirlerini listeleyiniz.
-----------------------------------------------------------------------------*/
select isim,maas,sehir from personel where sirket ýn (select sirket_adi from sirketler where sirket_id>101);
* -----------------------------------------------------------------------------
  ORNEK3:  Ankara’da personeli olan þirketlerin þirket id’lerini ve personel
  sayýlarýný listeleyiniz
-----------------------------------------------------------------------------*/
SELECT sirket_id,personel_sayisi from sirketler where sirket_adi ýn(select sirket from personel where sehir='Ankara');
/* -----------------------------------------------------------------------------
  ORNEK4: Her þirketin ismini, personel sayýsýný ve o þirkete ait personelin
  toplam maaþýný listeleyen bir Sorgu yazýnýz.
 -------------------------------------------------------------*/
 select sirket_adi,personel_sayisi, 
 (select sum(maas) from personel where sirketler.sirket_adi=sirket)as toplam_maas 
 from sirketler;
 /* -----------------------------------------------------------------------------
  ORNEK5: Her þirketin ismini, personel sayýsýný ve o þirkete ait personelin
  ortalama maaþýný listeleyen bir Sorgu yazýnýz.
-----------------------------------------------------------------------------*/
select sirket_adi,personel_sayisi,(select round(avg(maas,2) from personel where sirket=sirket_adi) as ort_maas from sirketler;
 /* ===================== AGGREGATE METOT KULLANIMI ===========================
    Aggregate Metotlarý(SUM,COUNT, MIN,MAX, AVG) Subquery içinde kullanýlabilir.
    Ancak, Sorgu tek bir deðer döndüryor olmalýdýr.
==============================================================================*/ 
/* -----------------------------------------------------------------------------
  ORNEK6: Her þirketin ismini, personel sayýsýný ve o þirkete ait personelin
  maks ve minimum maaþýný listeleyen bir Sorgu yazýnýz.
-----------------------------------------------------------------------------*/
select sirket_adi,personel_sayisi,(select MAX(maas) from personel where sirket=sirket_adi) AS maks_maas,
(select MIN(maas) from personel where sirket=sirket_adi) as min_maas from sirketler;
/* -----------------------------------------------------------------------------
  ORNEK8: Her sirketin id’sini, ismini ve toplam kaç þehirde bulunduðunu 
  listeleyen bir SORGU yazýnýz.
 -------------------------------------------------------------------------*/
 select sirket_id,sirket_adi,(select count(sehir) from personel where sirket=sirketler.sirket_adi)as sehir_sayisi 
 from sirketler;
