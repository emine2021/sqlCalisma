--delete from tablo adý; tablonun tüm içeriðini siler
--bu komut bir dml komutudur dolayýsýyla devamýnda where gibi cümlecikler kullanýlabilir
--delete from tablo_adý
--where sutun_adý = veri;
 CREATE TABLE ogrenciler
    (
        id CHAR(3),
        isim VARCHAR2(50),
        veli_isim VARCHAR2(50),
        yazili_notu NUMBER(3)       
    );
    
    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO ogrenciler VALUES(126, 'Nesibe Yýlmaz', 'Ayse',95);
	INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
?
    SELECT * FROM ogrenciler;
    --ÝD SÝ 124 OLAN OGRENCÝYÝ SÝLELÝ
    DELETE FROM ogrenciler where id=124;
    --adý kemal yaþa olaný sil
    delete from ogrenciler where isim='Kemal Yasa';
    --birden çok þey silmek
    delete from ogrenciler where isim='Nesibe Yýlmaz' or isim='Mustafa Bak';--tek deðiþken olduðu için or kullandýk
    delete from ogrenciler where isim in ('Nesibe Yýlmaz','Mustafa Bak');
    delete from ogrenciler where isim='Ali Can' and id=123;
    --id si 126 dan büyük olanlarý silelim
    delete from ogrenciler where id>124;
    --id 123,124 olanlaeý sileliö
    delete from ogrenciler where id in (123,124);
    delete from ogrenciler; -- tablodaki verileri tamamen siler
    ROLLBACK;
    --drop table ogrenciler;  tabloyu tamamen siler ve çöp kutusuna yollar(DDL data definition language komutudur)
    flashback table ogrenciler to before drop;-- çöp kutusunda olan tabloyu geri getirir
    drop table ogrenciler purge; -- tamamen siler çöp kutusuna atmaz
    
    --========truncate=============
    --delete gibi tüm verileri siler DDL komutudur. Seçmeli silme yapmaz
    --truncate ile silinme yapýldýðýnda roll back ile geri alma yapmaz.geri alma çok zor
    truncate table ogrenciler;
    
    CREATE TABLE talebeler
    (
        id CHAR(3),
        isim VARCHAR2(50),
        veli_isim VARCHAR2(50),
        yazili_notu NUMBER(3),
        CONSTRAINT talebe_pk PRIMARY KEY (id)
    );
    
    INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO talebeler VALUES(126, 'Nesibe Yýlmaz', 'Ayse',95);
	INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

     CREATE TABLE notlar 
    ( 
        talebe_id char(3), 
        ders_adi varchar2(30), 
        yazili_notu number (3), 
        CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) 
        REFERENCES talebeler(id) ON DELETE CASCADE -- DERSEK CHÝLD DA KULLANILIR VE PARENTDA SÝLÝNEN BÝR KAYIT ÝLE ÝLÝÞKÝLÝ OLAN TÜM CHÝLD KAYITLARI SÝLER
    ); -- ÝLÝÞKÝ KURULAN YERE CASCADE KAYDINI DÜÞMEK GEREK
    --CASCADE YOKDA CHÝLD DA ÝLÝÞKÝLÝ TÜM KAYITLARI SÝLMEDEN PARENT DA SÝLME YAPILAMAZ
    /*============================== ON DELETE CASCADE =============================
?
  Her defasýnda önce child tablodaki verileri silmek yerine ON DELETE CASCADE
  silme özelliðini aktif hale getirebiliriz.
  
  Bunun için FK olan satýrýn en sonuna ON DELETE CASCADE komutunu yazmak yeterli
  
==============================================================================*/ 
?
    INSERT INTO notlar VALUES ('123','kimya',75);
    INSERT INTO notlar VALUES ('124', 'fizik',65);
    INSERT INTO notlar VALUES ('124', 'fizik',75);
    INSERT INTO notlar VALUES ('125', 'tarih',90);
	INSERT INTO notlar VALUES ('126', 'Matematik',90);
    delete from notlar where talebe_ýd=124;
    delete from talebeler where id=124;
    
    
    
    
    
    