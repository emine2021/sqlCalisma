/*==================== SET OPERATORLERI: UNION, UNION ALL======================
    
    UNION, UNION ALL, INTERSECT, ve MINUS gibi SET operatorleri yardimiyla  
    Çoklu Sorgular birlestirilebilirler.
    UNION :  Bir SET operatorudur. 2 veya daha fazla Sorgu ifadesinin sonuc 
    kumelerini birlesitirerek tek bir sonuc kumesi olusturur.    
   
    NOT:  Birleþik olan olan Sorgu ifadesinin veri türü diðer sorgulardaki 
    ifadelerin veri türü ile uyumlu olmalýdýr.
    
    Syntax:
    ----------
    SELECT sutun_adi,sutun_adi2, .. FROM tablo_adi1
    UNION
    SELECT sutun_adi1, sutun_adi2, .. FROM tablo_adi2;
    
    NOT: UNION operatoru SADECE benzersi degerleri alýr. Benzerli verileri almak
    için UNION ALL kullanýlýr.
==============================================================================*/ 
CREATE TABLE personel 
    (
        id NUMBER(9), 
        isim VARCHAR2(50), 
        sehir VARCHAR2(50), 
        maas NUMBER(20), 
        sirket VARCHAR2(20),
        CONSTRAINT personel_pk PRIMARY KEY(id)
    );
    
    INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
    INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
    INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
    INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
    INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
    INSERT INTO personel VALUES(453445611, 'Veli Sahin', 'Ankara', 4500, 'Ford');
    INSERT INTO personel VALUES(123456710, 'Hatice Sahin','Bursa', 4200, 'Honda');
    
    SELECT * FROM personel;
    /* -----------------------------------------------------------------------------
  ORNEK1: Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas
  alinan sehirleri gosteren sorguyu yaziniz
------------------------------------------------------------------------------*/
(select isim as sonuc,maas from personel where maas>4000) unýon (select sehir,maas from personel where maas>5000);
/* -----------------------------------------------------------------------------
  ORNEK2: Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas
  alinan sehirleri gosteren sorguyu Tekrarlý verileri de gösterecek þekilde
  yaziniz.
------------------------------------------------------------------------------*/
select isim from personel where maas>4000
unýon all
select sehir from personel where maas>5000;
/* -----------------------------------------------------------------------------
  ORNEK3: Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki
  personelin maaslarini yüksekten açaða doðru sýralayarak bir tabloda gosteren
  sorguyu yaziniz.   
------------------------------------------------------------------------------*/
select maas,isim as isim_sehir from personel where isim='Mehmet Ozturk' -- deðiþkenleri sýrayla koymak lazým birleþecek olanlarýn veri tipi ayný olmalý!!!!!
UNION
select maas,sehir from personel where sehir='Istanbul' order by maas desc;
/*!!!!Every SELECT statement within UNION must have the same number of columns
      The columns must also have similar data types
      The columns in every SELECT statement must also be in the same order!!!!!*/

/*======================== FARKLI TABLOLARDAN BIRLESTIRME ====================*/   
    
    CREATE TABLE personel_bilgi 
    (
        id NUMBER(9), 
        tel char(10) UNIQUE , 
        cocuk_sayisi NUMBER(2), 
        CONSTRAINT fk_personel FOREIGN KEY (id) REFERENCES personel(id) 
    ); 
    
    INSERT INTO personel_bilgi VALUES(123456789, '5302345678' , 5);
    INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
    INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3); 
    INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
    INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
    INSERT INTO personel_bilgi VALUES(453445611, '5524578574', 2);
    INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);
?
    SELECT * FROM personel_bilgi;
?
/* -----------------------------------------------------------------------------
  ORNEK4: id’si 123456789 olan personelin Personel tablosundan sehir ve 
  maasini, personel_bilgi tablosundan da tel ve cocuk sayisini yazdirin  
------------------------------------------------------------------------------*/  
select sehir,maas as maas_cocuksayýsý from personel where id=123456789
unýon 
select tel,cocuk_sayisi from personel_bilgi where id=123456789 ;
/*========================= SET OPERATORLERI: INTERSECT ========================
    
    INTERSECT operarotu 2 veya daha fazla Sorgu ifadesinin sonuclarini 
    dondurmek icin kullanilir. Ancak, intersect SADECE tum sorgularin ortak 
    verilerini (kesimlerini) dondurur. 
    
    Syntax:
    ----------
    SELECT sutun_adi,sutun_adi2, .. FROM tablo_adi1
    INTERESCT
    SELECT sutun_adi1, sutun_adi2, .. FROM tablo_adi2;
    
==============================================================================*/
/* -----------------------------------------------------------------------------
  ORNEK5: Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini
  sorgulayiniz. 
 
  Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini sorgulayiniz.
  Bu iki sorguyu INTERSECT ile birlesitiriniz.
------------------------------------------------------------------------------*/
select id from personel where sehir ýn ('Istanbul', 'Ankara')
ýntersect
select id from personel_bilgi where cocuk_sayisi ýn (2,3);
/* -----------------------------------------------------------------------------
  ORNEK6: Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
------------------------------------------------------------------------------*/
select isim from personel where sirket='Honda' ýntersect select isim from personel where sirket='Ford'
ýntersect select isim from personel where sirket='Tofas';

/*========================= SET OPERATORLERI: MINUS ============================
    
    MINUS operatoru ilk Sorgu ifadesinde olup da diger sorgu ifadesinde olmayan 
    verileri dondurur. Yani 1. sorgu ile 2. sorgu arasindaki farklý olanlarý 
    dondurur
    
    
    Syntax:
    ----------
    SELECT sutun_adi,sutun_adi2, .. FROM tablo_adi1
    MINUS
    SELECT sutun_adi1, sutun_adi2, .. FROM tablo_adi2;
    
==============================================================================*/
/* -----------------------------------------------------------------------------
  ORNEK7: 5000’den az maas alan ve Honda calisani olmayanlarýn bilgilerini
  listeleyen bir sorgu yaziniz. 
------------------------------------------------------------------------------*/
select * from personel where maas<5000
mýnus
select * from personel where sirket='Honda';
/* -----------------------------------------------------------------------------
  ORNEK8: Ismi Mehmet Ozturk olup Istanbul’da calismayanlarin isimlerini ve
  sehirlerini listeleyen sorguyu yaziniz.
------------------------------------------------------------------------------*/
select isim,sehir from personel where isim='Mehmet Ozturk'
mýnus
select isim,sehir from personel where sehir='Istanbul';