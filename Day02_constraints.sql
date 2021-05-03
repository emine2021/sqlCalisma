/*
constraints-k�s�tlamalar tablodaki verinin do�rulu�u ve g�venilirli�i sa�lanabilir
not null,unique, primary key(not null+unique), foreign key, check, default(herhangi bir de�er atanmas���nda
NOT NULL - B�R SUTUNUN NULL ��ERMEMES�N� GARANT� EDER
UNIQUE - B�R SUTUNDAK� TUM DE�ERLER�N BENZERS�Z OLMASINI GARANT� EDER
PRIMARY KEY - B�R SUTUNUN NULL ��ERMEMES�N� VE SUTUNDAK� VER�LER�N BENZERS�Z OLMASINI GARANT� EDER
FORE�GN KEY - BA�KA B�R TABLODAK� PR�MARY KEY � REFERANS G�STERMEK ���N KULLANILIR.B�YLEL�KKLE TABLOLAR ARASINDA �L��K� KURULMU� OLUR
CHECK - SUTUNDAK� T�M VER�LER�N BEL�RLENEN �ZEL �ARTI SA�LAMASINI GARANT� EDER
DEFAULT - HERHANG� DE�ER ATANAMADI�INDA BA�LANGI� DE�ER�N�N ATANMASINI SA�LAR
*/
CREATE TABLE cal�sanlar
(
    id CHAR(5) PRIMARY KEY,
    isim VARCHAR(50),
    maas NUMBER(5),
    ise_baslama date
);
INSERT INTO calisanlar VALUES('10001', 'Ahmet Aslan', 7000, '13/04/2018');
INSERT INTO calisanlar VALUES('10002', 'Mehmet Y�lmaz', 12000, '14/04/2018');
INSERT INTO calisanlar VALUES('10003', '', 5000, '13/04/2018');
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '13/04/2018');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '14/04/2018');
INSERT INTO calisanlar VALUES('10006', 'CANAN Ali', 4000, '12/09/2019');
select * from calisanlar;
DROP TABLE calisanlar;
delete cal�sanlar where id='10001';
---------------------------------------------
--alternatif primary key tan�mlama
CREATE TABLE cal�sanlar
(
    id CHAR(5) ,
    isim VARCHAR(50),
    maas NUMBER(5),
    ise_baslama date,
    CONSTRAINT id_pk PRIMARY key(id)   --DISABLE  diyerek iptal edebiliriz
);

INSERT INTO calisanlar VALUES('10001', 'Ahmet Aslan', 7000, '13/04/2018');
INSERT INTO calisanlar VALUES('10002', 'Mehmet Y�lmaz', 12000, '14/04/2018');
INSERT INTO calisanlar VALUES('10003', '', 5000, '13/04/2018');
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '13/04/2018');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '14/04/2018');
INSERT INTO calisanlar VALUES('10006', 'CANAN Ali', 4000, '12/09/2019');

drop table calisanlar;

create table adresler
(
    adres_id CHAR(5) REFERENCES calisanlar(id),
    sokak VARCHAR2(50),
    cadde VARCHAR2(30),
    sehir VARCHAR2(15)
);
drop table adresler;

create table adresler
(
    adres_id CHAR(5) ,
    sokak VARCHAR2(50),
    cadde VARCHAR2(30),
    sehir VARCHAR2(15),
    CONSTRAINT id_fk FOREIGN KEY(adres_id) REFERENCES calisanlar(id) --DISABLE diyerek inaktif yapabiliriz
);
INSERT INTO adresler VALUES('10001', 'Mutlu Sok', '40.cad', 'IST');
INSERT INTO adresler VALUES('10001', 'Can Sok', '50.cad', 'Ankara');
INSERT INTO adresler VALUES('10002', 'A�a Sok', '30.cad', 'Antep');
INSERT INTO adresler VALUES('', 'A�a Sok', '30.cad', 'Antep');

--parent da olmayan bir id ye child da de�er atanamaz,ekleme yap�lamaz
--silmeye �al���rken de �nce child silinmeli yoksa hata al�n�r

select * from adresler;
select * from cal�sanlar;

select * from cal�sanlar,adresler
where id='10001';
