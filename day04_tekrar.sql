/* ============================== UPDATE SET ===================================    
    
 Ýlk olarak aþaðýdaki gibi tedarikciler adýnda bir tablo oluþturunu ve 
   vergi_no sutununu primary key yapýnýz.Ayýra aþðýdaki verileri tabloya giriniz.
    vergi_no NUMBER(3),
    firma_ismi VARCHAR2(50),
    irtibat_ismi VARCHAR2(50),
        
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
        
    Sonrasýnda aþaðýdaki gibi urunler adýnda bir baþka tablo oluþturunuz ve bu
    tablonun ted_vergino sutunu ile tedarikciler tablosunun vergi_no sutularý
    yardýmýyla iliþki kurunuz. Verileri giriniz.
    ted_vergino NUMBER(3), 
    urun_id NUMBER(11), 
    urun_isim VARCHAR2(50), 
    musteri_isim VARCHAR2(50),
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayþe Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yýlmaz');
    
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
SELECT * FROM tedarýkcýler;
CREATE TABLE urunler
    (
        ted_vergino NUMBER(3),
        urun_id NUMBER(11),
        urun_isim VARCHAR2(50),
        musteri_isim VARCHAR2(50),
        CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
    );
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayþe Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yýlmaz');
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler;
    --syntax  update tablo adý set sutun adý= yeni deðer where sutunadý;
    /*ORNEK1: vergi nosu 101 olan tedarikçinin ismini lg olarak güncelleyiniz*/
    update tedarikciler set  fýrma_ýsmý='LG' where vergý_no=101;
    /*ORNEK2: tedarikçiler tablosundaki tüm firma isimlerini'samsung' olarak güncelleyiniz*/
    update tedarýkcýler set fýrma_ýsmý='SAMSUNG';
    --tablonun içeriðini silmek içiin DELETE
    --tabloyu silmek için DROP
    /*ORNEK3 = vergi nosu 102 olan tedarikçinin ismini Samsung ve irtibat ismini'Ali Veli' olarak güncelleyiniz*/
    UPDATE tedarýkcýler set fýrma_ýsmý='Samsung',ýrtýbat_ýsmý='Ali Veli' where vergý_no=102;
    --ismi samsung olan tedarikçinin irtibat ismini Ayþe Yýlmaz olarak güncelleyiniz
    update tedarýkcýler set ýrtýbat_ýsmý='Ayse Yýlmaz' where fýrma_ýsmý='Samsung';
    --urunler tablosundaki phone deðerlerii telefon olarak güncelle
    update urunler set urun_ýsým='Telefon' where urun_ýsým='Phone';
    --urunler tablosundaki urun_id deðeri 1004 ten büyük olanlarýn deðerleini bir artýrýnýz
    update urunler set urun_ýd=urun_ýd+1 where urun_ýd>1004;
    --tüm ürünlerin urun_id deðerini ted_vergino sutun deðerleri ile toplayarak güncelleyiniz
    update urunler set urun_ýd=urun_ýd+ted_vergýno;
    --urunler tablosundan ali bak ýn aldýðý urunun ismini, tedarikçi tablosunda irtibat ismi Adam Eve olan firmanýn
    --ismi ile deðiþtiriniz
    update urunler set urun_ýsým = (select firma_ismi from tedarýkcýler where irtibat_ismi='Adam Eve') 
    where musterý_ýsým='Ali Bak';   
    --laptop satýn alan musterilerin ismini Apple ýn irtibat ismi ile deðiþtirin
    UPDATE urunler set musterý_ýsým=(select irtibat_ismi from tedarikciler where firma_ismi='Apple') 
    where urun_isim='Laptop';
    
    