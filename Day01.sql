create table student --bir kere olu�turur tekrar olu�turmak istedi�imizde hata verir**"name is already used by an existing object"
(
    std_id char(3),
    std_name varchar(20),
    std_age number
);
--drop table student;
INSERT INTO student VALUES('101', 'ahmet can', 30);--EKLEME YAPIYORUZ
INSERT INTO student VALUES('102', 'MUSTAFA AL�', 20);
INSERT INTO student VALUES('103', 'AY�E YILMAZ', 18);
INSERT INTO student VALUES('104', 'MEL�H G�R', 40);

INSERT INTO student(std_id, std_name) VALUES ('105','JOHN TRAVOLTA'); -- par�al� giri� yapmak i�in ya da
INSERT INTO student VALUES('106','EM�NE KELE�',''); --BO� BIRAKARAK DA AYNI SONUCU ELDE EDEB�L�R�Z
SELECT * FROM STUDENT;--OKUYORUZ
CREATE TABLE urunler
(
    urun_id NUMBER,
    urun_ad� VARCHAR2(50),
    fiyat NUMBER(5,2),
    tett DATE,
    stok_adedi NUMBER(10)    
);
INSERT INTO urunler VALUES(100, 'C�PS', 5.50,'01/05/2022',500);
INSERT INTO urunler VALUES(101, 'KOLA', 7.50,'08/05/2022',500);
INSERT INTO urunler VALUES(102, 'AYRAN', 3.80,'21/05/2025',500);
INSERT INTO urunler VALUES(103, 'B�SK�V�', 1.20,'30/05/2028',500);
SELECT * FROM urunler;





















