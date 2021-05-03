/*===================== IS NULL, IS NOT NULL, COALESCE ========================
    
    IS NULL, ve IS NOT NULL BOOLEAN operatörleridir. Bir ifadenin NULL olup 
    olmadýðýný kontrol ederler.  
    
    COALESCE ise bir fonksiyondur ve içerisindeki parameterelerden NULL olmayan
    ilk ifadeyi döndürür. Eðer aldýðý tüm ifadeler NULL ise NULL döndürürür.
    
    COALESCE(ifade1, ifade2, .....ifadeN)
    
==============================================================================*/
CREATE TABLE insanlar 
    (
        ssn CHAR(9),
        isim VARCHAR2(50), 
        adres VARCHAR2(50) 
    );
?
    INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');
    INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');
    INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');
    INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');
    INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');
    INSERT INTO insanlar (adres) VALUES('Sakarya');
    INSERT INTO insanlar (ssn) VALUES(999111222);
    CREATE TABLE insanlar 
    (
        ssn CHAR(9),
        isim VARCHAR2(50), 
        adres VARCHAR2(50) 
    );
?
    INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');
    INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');
    INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');
    INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');
    INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');
    INSERT INTO insanlar (adres) VALUES('Sakarya');
    INSERT INTO insanlar (ssn) VALUES(999111222);
    select * from insanlar;
    /* ----------------------------------------------------------------------------
  ORNEK1: isim ’i NULL olanlarý sorgulayýnýz.
-----------------------------------------------------------------------------*/
    select * from insanlar where isim ýs null;
    select * from insanlar where isim ýs not null;
/* ----------------------------------------------------------------------------
  ORNEK3: NULL olanlarýn isimlerine no name yazalým
-----------------------------------------------------------------------------*/
update insanlar set isim='noname' where isim ýs null;
/* ----------------------------------------------------------------------------
  ORNEK4:   isim ’i NULL olanlara ‘Henuz isim girilmedi’
            adres ’i NULL olanlara ‘Henuz adres girilmedi’
            ssn ’i NULL olanlara ‘no ssn ’ atayalým.
-----------------------------------------------------------------------------*/
    update insanlar set isim=coalesce(isim,'Henuz isim girilmedi'),
                        adres=coalesce(adres,'Henuz adres girilmedi'),
                        ssn=coalesce(ssn,'No ssn');
    
    
    