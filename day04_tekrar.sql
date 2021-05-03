/* ============================== UPDATE SET ===================================    
    
 �lk olarak a�a��daki gibi tedarikciler ad�nda bir tablo olu�turunu ve 
   vergi_no sutununu primary key yap�n�z.Ay�ra a���daki verileri tabloya giriniz.
    vergi_no NUMBER(3),
    firma_ismi VARCHAR2(50),
    irtibat_ismi VARCHAR2(50),
        
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei', '�in Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
        
    Sonras�nda a�a��daki gibi urunler ad�nda bir ba�ka tablo olu�turunuz ve bu
    tablonun ted_vergino sutunu ile tedarikciler tablosunun vergi_no sutular�
    yard�m�yla ili�ki kurunuz. Verileri giriniz.
    ted_vergino NUMBER(3), 
    urun_id NUMBER(11), 
    urun_isim VARCHAR2(50), 
    musteri_isim VARCHAR2(50),
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ay�e Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan �z');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Y�lmaz');
    
==============================================================================*/  
CREATE TABLE tedarikCiler
(
vergi_no NUMBER(3),
firma_ismi VARCHAR2(50),
irtibat_ismi VARCHAR2(50),
CONSTRAINT pk_ted PRIMARY KEY(vergi_no)
);
drop table tedarikciler;
INSERT INTO tedarikciler VALUES (101 , 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102 , 'Huawei', 'Cin Li');
INSERT INTO tedarikciler VALUES (103 , 'Erikson', 'Maki Tammamen');
INSERT INTO tedarikciler VALUES (104 , 'Apple', 'Adam Eve');
SELECT * FROM tedar�kc�ler;
CREATE TABLE urunler
    (
        ted_vergino NUMBER(3),
        urun_id NUMBER(11),
        urun_isim VARCHAR2(50),
        musteri_isim VARCHAR2(50),
        CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
    );
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ay�e Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan �z');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Y�lmaz');
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler;
    --syntax  update tablo ad� set sutun ad�= yeni de�er where sutunad�;
    /*ORNEK1: vergi nosu 101 olan tedarik�inin ismini lg olarak g�ncelleyiniz*/
    update tedarikciler set  f�rma_�sm�='LG' where verg�_no=101;
    /*ORNEK2: tedarik�iler tablosundaki t�m firma isimlerini'samsung' olarak g�ncelleyiniz*/
    update tedar�kc�ler set f�rma_�sm�='SAMSUNG';
    --tablonun i�eri�ini silmek i�iin DELETE
    --tabloyu silmek i�in DROP
    /*ORNEK3 = vergi nosu 102 olan tedarik�inin ismini Samsung ve irtibat ismini'Ali Veli' olarak g�ncelleyiniz*/
    UPDATE tedar�kc�ler set f�rma_�sm�='Samsung',�rt�bat_�sm�='Ali Veli' where verg�_no=102;
    --ismi samsung olan tedarik�inin irtibat ismini Ay�e Y�lmaz olarak g�ncelleyiniz
    update tedar�kc�ler set �rt�bat_�sm�='Ayse Y�lmaz' where f�rma_�sm�='Samsung';
    --urunler tablosundaki phone de�erlerii telefon olarak g�ncelle
    update urunler set urun_�s�m='Telefon' where urun_�s�m='Phone';
    --urunler tablosundaki urun_id de�eri 1004 ten b�y�k olanlar�n de�erleini bir art�r�n�z
    update urunler set urun_�d=urun_�d+1 where urun_�d>1004;
    --t�m �r�nlerin urun_id de�erini ted_vergino sutun de�erleri ile toplayarak g�ncelleyiniz
    update urunler set urun_�d=urun_�d+ted_verg�no;
    --urunler tablosundan ali bak �n ald��� urunun ismini, tedarik�i tablosunda irtibat ismi Adam Eve olan firman�n
    --ismi ile de�i�tiriniz
    update urunler set urun_�s�m = (select firma_ismi from tedar�kc�ler where irtibat_ismi='Adam Eve') 
    where muster�_�s�m='Ali Bak';   
    --laptop sat�n alan musterilerin ismini Apple �n irtibat ismi ile de�i�tirin
    UPDATE urunler set muster�_�s�m=(select irtibat_ismi from tedarikciler where firma_ismi='Apple') 
    where urun_isim='Laptop';
    
    