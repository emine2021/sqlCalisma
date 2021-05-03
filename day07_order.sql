/*================================ ORDER BY  ===================================
   ORDER BY cümleciði bir SORGU deyimi içerisinde belli bir SUTUN’a göre 
   SIRALAMA yapmak için kullanýlýr.
   
   Syntax
   -------
      ORDER BY sutun_adi ASC   -- ARTAN
      ORDER BY sutun_adi DESC  -- AZALAN
==============================================================================*/
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
    * ----------------------------------------------------------------------------
  ORNEK1: kisiler tablosunu adres’e göre sýralayarak sorgulayýnýz.
-----------------------------------------------------------------------------*/
    select * from kisiler order by adres;    --ASC gibi sýraladý
* ----------------------------------------------------------------------------
  ORNEK2: kisiler tablosunu maas’a göre sýralayarak sorgulayýnýz.
-----------------------------------------------------------------------------*/
    select * from kisiler order by maas;
    select * from kisiler order by maas desc;  -- azalan
/*----------------------------------------------------------------------------
  ORNEK4: ismi Mine olanlarý, SSN’e göre AZALAN sýrada sorgulayýnýz.
-----------------------------------------------------------------------------*/
select * from kisiler where isim='Mine' order by ssn desc;
select * from kisiler where soyisim='Bulut' order by isim;
/* ----------------------------------------------------------------------------
  ORNEK1: MAAÞ’ý en yüksek 3 kiþinin bilgilerini listeleyen sorguyu yazýnýz.
-----------------------------------------------------------------------------*/
/*====================== FETCH NEXT, OFFSET (12C VE ÜSTÜ) ======================
   FETCH cümleciði ile listelenecek kayýtlarý sýnýrlandýrabiliriz. Ýstersek 
   satýr sayýsýna göre istersek de toplam satýr sayýsýnýn belli bir yüzdesine 
   göre sýnýrlandýrma koymak mümkündür. 
   
   Syntax
   ---------
   FETCH NEXT satir_sayisi ROWS ONLY;
   FETCH NEXT satir_yuzdesi PERCENT ROWS ONLY;
   
   
   OFFSET Cümleciði ile de listenecek olan satýrlardan sýrasýyla istediðimiz 
   kadarýný atlayabiliriz.  
   
   Syntax
   ----------
   OFFSET satýr_sayisi ROWS;
  
==============================================================================*/
select * from kisiler order by maas desc
fetch next 3 rows only;
select * from kisiler order by maas fetch next 2 rows only;
--maasa göre sýlamada 4. ile 6.kisilerin bilgilerini listele
select * from kisiler order by maas desc 
offset 3 rows -- ilk 3 kaydý atladýk
fetch next 3 rows only;  -- sonraki 3 kaydý aldýk

 /*============================= GROUP BY =====================================
    
    GROUP BY cümleciði bir SELECT ifadesinde satýrlarý, sutunlarýn deðerlerine 
    göre özet olarak gruplamak için kullanýlýr. 
   
    GROUP BY cümleceði her grup baþýna bir satýr döndürür. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonlarý ile birlikte kullanýlýr.
    
==============================================================================*/
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
  ORNEK1: kisi ismine göre satýlan toplam meyve miktarlarýný gösteren sorguyu
  yazýnýz.
------------------------------------------------------------------------------*/
select isim,sum(urun_miktarý)as toplam_urun from manav group by isim order by toplam_urun;
/* ----------------------------------------------------------------------------
  ORNEK2: satýlan meyve türüne (urun_adi) göre urun alan kiþi sayýsýný gösteren
  sorguyu yazýnýz. NULL olarak girilen meyveyi listelemesin.
-----------------------------------------------------------------------------*/
select urun_adi, count(isim) as kisi_sayisi from manav where urun_adi ýs not null group by urun_adi order by kisi_sayisi;
/* ----------------------------------------------------------------------------
  ORNEK3: satýlan meyve türüne (urun_adi) göre satýlan MIN ve MAX urun
  miktarlarini MAX urun miktarina göre sýralayarak listeyen sorguyu yazýnýz.
-----------------------------------------------------------------------------*/
select urun_adi,max(urun_miktarý) as max_miktar,mýn(urun_miktarý) as min_miktar from manav 
where urun_adi ýs not null group by urun_adi order by max(urun_miktarý);
/* ----------------------------------------------------------------------------
  ORNEK4: kisi ismine ve urun adýna göre satýlan ürünlerin toplamýný
  gruplandýran ve isime göre ters sýrasýda listeyen sorguyu yazýnýz.
-----------------------------------------------------------------------------*/
select isim,urun_adi,sum(urun_miktarý) from manav group by (urun_adi,isim) order by isim desc;
/* ----------------------------------------------------------------------------
  ORNEK5: kisi ismine ve urun adýna göre satýlan ürünlerin toplamýný bulan ve
  ve bu toplam deðeri 3'den fazla olanlarý listeyen sorguyu yazýnýz.
-----------------------------------------------------------------------------*/
select isim,urun_adi,sum(urun_miktari) from manav where sum(urun_miktari)>3 group by isim,urun_adi; -- HATA VERÝR
--eðer aggregate func lar ile þart vermek gerekirse where deðil group by dan sonra HAVING  olacak
select isim,urun_adi,sum(urun_miktari) from manav group by isim,urun_adi having sum(urun_miktari)>=3 order by sum(urun_miktarý) desc ;
/* ----------------------------------------------------------------------------
  ORNEK6: satýlan urun_adi’na göre MAX urun sayýlarýný sýralayarak listeyen
  sorguyu yazýnýz. NOT: Sorgu, sadece MAKS urun_miktari MIN urun_miktarýna
  eþit olmayan kayýtlarý listelemelidir.
-----------------------------------------------------------------------------*/
select urun_adi,max(urun_miktarý) from manav group by urun_adi having max(urun_miktarý)<>min(urun_miktarý);
/*============================= DISTINCT =====================================
   
    DISTINCT cümleciði bir SORGU ifadesinde benzer olan satýrlarý flitrelemek
    için kullanýlýr. Dolayýsýyla seçilen sutun yada sutunlar için benzersiz veri
    içeren satýrlar oluþturmaya yarar.
  
    SYNTAX
    -------
    SELECT DISTINCT sutun_adi1, sutun_adi2, column_3
    FROM  tablo_adý;
==============================================================================*/
* ----------------------------------------------------------------------------
  ORNEK1: satýlan farklý meyve türlerinin sayýsýný  listeyen sorguyu yazýnýz.
-----------------------------------------------------------------------------*/
select  count(dýstýnct urun_adi) from manav ;
--satýlan meyve ve isinlerin farklý olanlarýný listeleyen sorguyu yazýnýz
select dýstýnct urun_adi,isim from manav; -- 2 sutun için benzerli olanlarý çýkarýyor
select sum (dýstýnct urun_miktarý) from manav;


    