--delete from tablo ad�; tablonun t�m i�eri�ini siler
--bu komut bir dml komutudur dolay�s�yla devam�nda where gibi c�mlecikler kullan�labilir
--delete from tablo_ad�
--where sutun_ad� = veri;
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
    INSERT INTO ogrenciler VALUES(126, 'Nesibe Y�lmaz', 'Ayse',95);
	INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
?
    SELECT * FROM ogrenciler;
    --�D S� 124 OLAN OGRENC�Y� S�LEL�
    DELETE FROM ogrenciler where id=124;
    --ad� kemal ya�a olan� sil
    delete from ogrenciler where isim='Kemal Yasa';
    --birden �ok �ey silmek
    delete from ogrenciler where isim='Nesibe Y�lmaz' or isim='Mustafa Bak';--tek de�i�ken oldu�u i�in or kulland�k
    delete from ogrenciler where isim in ('Nesibe Y�lmaz','Mustafa Bak');
    delete from ogrenciler where isim='Ali Can' and id=123;
    --id si 126 dan b�y�k olanlar� silelim
    delete from ogrenciler where id>124;
    --id 123,124 olanlae� sileli�
    delete from ogrenciler where id in (123,124);
    delete from ogrenciler; -- tablodaki verileri tamamen siler
    ROLLBACK;
    --drop table ogrenciler;  tabloyu tamamen siler ve ��p kutusuna yollar(DDL data definition language komutudur)
    flashback table ogrenciler to before drop;-- ��p kutusunda olan tabloyu geri getirir
    drop table ogrenciler purge; -- tamamen siler ��p kutusuna atmaz
    
    --========truncate=============
    --delete gibi t�m verileri siler DDL komutudur. Se�meli silme yapmaz
    --truncate ile silinme yap�ld���nda roll back ile geri alma yapmaz.geri alma �ok zor
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
    INSERT INTO talebeler VALUES(126, 'Nesibe Y�lmaz', 'Ayse',95);
	INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

     CREATE TABLE notlar 
    ( 
        talebe_id char(3), 
        ders_adi varchar2(30), 
        yazili_notu number (3), 
        CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) 
        REFERENCES talebeler(id) ON DELETE CASCADE -- DERSEK CH�LD DA KULLANILIR VE PARENTDA S�L�NEN B�R KAYIT �LE �L��K�L� OLAN T�M CH�LD KAYITLARI S�LER
    ); -- �L��K� KURULAN YERE CASCADE KAYDINI D��MEK GEREK
    --CASCADE YOKDA CH�LD DA �L��K�L� T�M KAYITLARI S�LMEDEN PARENT DA S�LME YAPILAMAZ
    /*============================== ON DELETE CASCADE =============================
?
  Her defas�nda �nce child tablodaki verileri silmek yerine ON DELETE CASCADE
  silme �zelli�ini aktif hale getirebiliriz.
  
  Bunun i�in FK olan sat�r�n en sonuna ON DELETE CASCADE komutunu yazmak yeterli
  
==============================================================================*/ 
?
    INSERT INTO notlar VALUES ('123','kimya',75);
    INSERT INTO notlar VALUES ('124', 'fizik',65);
    INSERT INTO notlar VALUES ('124', 'fizik',75);
    INSERT INTO notlar VALUES ('125', 'tarih',90);
	INSERT INTO notlar VALUES ('126', 'Matematik',90);
    delete from notlar where talebe_�d=124;
    delete from talebeler where id=124;
    
    
    
    
    
    