create table student --bir kere oluþturur tekrar oluþturmak istediðimizde hata verir**"name is already used by an existing object"
(
    std_id char(3),
    std_name varchar(20),
    std_age number
);
--drop table student;
INSERT INTO student VALUES('101', 'ahmet can', 30);--EKLEME YAPIYORUZ
INSERT INTO student VALUES('102', 'MUSTAFA ALÝ', 20);
INSERT INTO student VALUES('103', 'AYÞE YILMAZ', 18);
INSERT INTO student VALUES('104', 'MELÝH GÖR', 40);

INSERT INTO student(std_id, std_name) VALUES ('105','JOHN TRAVOLTA'); -- parçalý giriþ yapmak için ya da
INSERT INTO student VALUES('106','EMÝNE KELEÞ',''); --BOÞ BIRAKARAK DA AYNI SONUCU ELDE EDEBÝLÝRÝZ
SELECT * FROM STUDENT;--OKUYORUZ
CREATE TABLE urunler
(
    urun_id NUMBER,
    urun_adý VARCHAR2(50),
    fiyat NUMBER(5,2),
    tett DATE,
    stok_adedi NUMBER(10)    
);
INSERT INTO urunler VALUES(100, 'CÝPS', 5.50,'01/05/2022',500);
INSERT INTO urunler VALUES(101, 'KOLA', 7.50,'08/05/2022',500);
INSERT INTO urunler VALUES(102, 'AYRAN', 3.80,'21/05/2025',500);
INSERT INTO urunler VALUES(103, 'BÝSKÜVÝ', 1.20,'30/05/2028',500);
SELECT * FROM urunler;





















