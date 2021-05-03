/*================================ ORDER BY  ===================================
   ORDER BY c�mleci�i bir SORGU deyimi i�erisinde belli bir SUTUN�a g�re 
   SIRALAMA yapmak i�in kullan�l�r.
   
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
  ORNEK1: kisiler tablosunu adres�e g�re s�ralayarak sorgulay�n�z.
-----------------------------------------------------------------------------*/
    select * from kisiler order by adres;    --ASC gibi s�ralad�
* ----------------------------------------------------------------------------
  ORNEK2: kisiler tablosunu maas�a g�re s�ralayarak sorgulay�n�z.
-----------------------------------------------------------------------------*/
    select * from kisiler order by maas;
    select * from kisiler order by maas desc;  -- azalan
/*----------------------------------------------------------------------------
  ORNEK4: ismi Mine olanlar�, SSN�e g�re AZALAN s�rada sorgulay�n�z.
-----------------------------------------------------------------------------*/
select * from kisiler where isim='Mine' order by ssn desc;
select * from kisiler where soyisim='Bulut' order by isim;
/* ----------------------------------------------------------------------------
  ORNEK1: MAAޒ� en y�ksek 3 ki�inin bilgilerini listeleyen sorguyu yaz�n�z.
-----------------------------------------------------------------------------*/
/*====================== FETCH NEXT, OFFSET (12C VE �ST�) ======================
   FETCH c�mleci�i ile listelenecek kay�tlar� s�n�rland�rabiliriz. �stersek 
   sat�r say�s�na g�re istersek de toplam sat�r say�s�n�n belli bir y�zdesine 
   g�re s�n�rland�rma koymak m�mk�nd�r. 
   
   Syntax
   ---------
   FETCH NEXT satir_sayisi ROWS ONLY;
   FETCH NEXT satir_yuzdesi PERCENT ROWS ONLY;
   
   
   OFFSET C�mleci�i ile de listenecek olan sat�rlardan s�ras�yla istedi�imiz 
   kadar�n� atlayabiliriz.  
   
   Syntax
   ----------
   OFFSET sat�r_sayisi ROWS;
  
==============================================================================*/
select * from kisiler order by maas desc
fetch next 3 rows only;
select * from kisiler order by maas fetch next 2 rows only;
--maasa g�re s�lamada 4. ile 6.kisilerin bilgilerini listele
select * from kisiler order by maas desc 
offset 3 rows -- ilk 3 kayd� atlad�k
fetch next 3 rows only;  -- sonraki 3 kayd� ald�k

 /*============================= GROUP BY =====================================
    
    GROUP BY c�mleci�i bir SELECT ifadesinde sat�rlar�, sutunlar�n de�erlerine 
    g�re �zet olarak gruplamak i�in kullan�l�r. 
   
    GROUP BY c�mlece�i her grup ba��na bir sat�r d�nd�r�r. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonlar� ile birlikte kullan�l�r.
    
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
  ORNEK1: kisi ismine g�re sat�lan toplam meyve miktarlar�n� g�steren sorguyu
  yaz�n�z.
------------------------------------------------------------------------------*/
select isim,sum(urun_miktar�)as toplam_urun from manav group by isim order by toplam_urun;
/* ----------------------------------------------------------------------------
  ORNEK2: sat�lan meyve t�r�ne (urun_adi) g�re urun alan ki�i say�s�n� g�steren
  sorguyu yaz�n�z. NULL olarak girilen meyveyi listelemesin.
-----------------------------------------------------------------------------*/
select urun_adi, count(isim) as kisi_sayisi from manav where urun_adi �s not null group by urun_adi order by kisi_sayisi;
/* ----------------------------------------------------------------------------
  ORNEK3: sat�lan meyve t�r�ne (urun_adi) g�re sat�lan MIN ve MAX urun
  miktarlarini MAX urun miktarina g�re s�ralayarak listeyen sorguyu yaz�n�z.
-----------------------------------------------------------------------------*/
select urun_adi,max(urun_miktar�) as max_miktar,m�n(urun_miktar�) as min_miktar from manav 
where urun_adi �s not null group by urun_adi order by max(urun_miktar�);
/* ----------------------------------------------------------------------------
  ORNEK4: kisi ismine ve urun ad�na g�re sat�lan �r�nlerin toplam�n�
  grupland�ran ve isime g�re ters s�ras�da listeyen sorguyu yaz�n�z.
-----------------------------------------------------------------------------*/
select isim,urun_adi,sum(urun_miktar�) from manav group by (urun_adi,isim) order by isim desc;
/* ----------------------------------------------------------------------------
  ORNEK5: kisi ismine ve urun ad�na g�re sat�lan �r�nlerin toplam�n� bulan ve
  ve bu toplam de�eri 3'den fazla olanlar� listeyen sorguyu yaz�n�z.
-----------------------------------------------------------------------------*/
select isim,urun_adi,sum(urun_miktari) from manav where sum(urun_miktari)>3 group by isim,urun_adi; -- HATA VER�R
--e�er aggregate func lar ile �art vermek gerekirse where de�il group by dan sonra HAVING  olacak
select isim,urun_adi,sum(urun_miktari) from manav group by isim,urun_adi having sum(urun_miktari)>=3 order by sum(urun_miktar�) desc ;
/* ----------------------------------------------------------------------------
  ORNEK6: sat�lan urun_adi�na g�re MAX urun say�lar�n� s�ralayarak listeyen
  sorguyu yaz�n�z. NOT: Sorgu, sadece MAKS urun_miktari MIN urun_miktar�na
  e�it olmayan kay�tlar� listelemelidir.
-----------------------------------------------------------------------------*/
select urun_adi,max(urun_miktar�) from manav group by urun_adi having max(urun_miktar�)<>min(urun_miktar�);
/*============================= DISTINCT =====================================
   
    DISTINCT c�mleci�i bir SORGU ifadesinde benzer olan sat�rlar� flitrelemek
    i�in kullan�l�r. Dolay�s�yla se�ilen sutun yada sutunlar i�in benzersiz veri
    i�eren sat�rlar olu�turmaya yarar.
  
    SYNTAX
    -------
    SELECT DISTINCT sutun_adi1, sutun_adi2, column_3
    FROM  tablo_ad�;
==============================================================================*/
* ----------------------------------------------------------------------------
  ORNEK1: sat�lan farkl� meyve t�rlerinin say�s�n�  listeyen sorguyu yaz�n�z.
-----------------------------------------------------------------------------*/
select  count(d�st�nct urun_adi) from manav ;
--sat�lan meyve ve isinlerin farkl� olanlar�n� listeleyen sorguyu yaz�n�z
select d�st�nct urun_adi,isim from manav; -- 2 sutun i�in benzerli olanlar� ��kar�yor
select sum (d�st�nct urun_miktar�) from manav;


    