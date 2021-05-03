/*
constraints-kýsýtlamalar tablodaki verinin doðruluðu ve güvenilirliði saðlanabilir
not null,unique, primary key(not null+unique), foreign key, check, default(herhangi bir deðer atanmasýðýnda
NOT NULL - BÝR SUTUNUN NULL ÝÇERMEMESÝNÝ GARANTÝ EDER
UNIQUE - BÝR SUTUNDAKÝ TUM DEÐERLERÝN BENZERSÝZ OLMASINI GARANTÝ EDER
PRIMARY KEY - BÝR SUTUNUN NULL ÝÇERMEMESÝNÝ VE SUTUNDAKÝ VERÝLERÝN BENZERSÝZ OLMASINI GARANTÝ EDER
FOREÝGN KEY - BAÞKA BÝR TABLODAKÝ PRÝMARY KEY Ý REFERANS GÖSTERMEK ÝÇÝN KULLANILIR.BÖYLELÝKKLE TABLOLAR ARASINDA ÝLÝÞKÝ KURULMUÞ OLUR
CHECK - SUTUNDAKÝ TÜM VERÝLERÝN BELÝRLENEN ÖZEL ÞARTI SAÐLAMASINI GARANTÝ EDER
DEFAULT - HERHANGÝ DEÐER ATANAMADIÐINDA BAÞLANGIÇ DEÐERÝNÝN ATANMASINI SAÐLAR
*/
CREATE TABLE calýsanlar
(
    id CHAR(5) PRIMARY KEY,
    isim VARCHAR(50),
    maas NUMBER(5),
    ise_baslama date
);
INSERT INTO calisanlar VALUES('10001', 'Ahmet Aslan', 7000, '13/04/2018');
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yýlmaz', 12000, '14/04/2018');
INSERT INTO calisanlar VALUES('10003', '', 5000, '13/04/2018');
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '13/04/2018');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '14/04/2018');
INSERT INTO calisanlar VALUES('10006', 'CANAN Ali', 4000, '12/09/2019');
select * from calisanlar;
DROP TABLE calisanlar;
delete calýsanlar where id='10001';
---------------------------------------------
--alternatif primary key tanýmlama
CREATE TABLE calýsanlar
(
    id CHAR(5) ,
    isim VARCHAR(50),
    maas NUMBER(5),
    ise_baslama date,
    CONSTRAINT id_pk PRIMARY key(id)   --DISABLE  diyerek iptal edebiliriz
);

INSERT INTO calisanlar VALUES('10001', 'Ahmet Aslan', 7000, '13/04/2018');
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yýlmaz', 12000, '14/04/2018');
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
INSERT INTO adresler VALUES('10002', 'Aða Sok', '30.cad', 'Antep');
INSERT INTO adresler VALUES('', 'Aða Sok', '30.cad', 'Antep');

--parent da olmayan bir id ye child da deðer atanamaz,ekleme yapýlamaz
--silmeye çalýþýrken de önce child silinmeli yoksa hata alýnýr

select * from adresler;
select * from calýsanlar;

select * from calýsanlar,adresler
where id='10001';
