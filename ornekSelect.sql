/*
======================= SELECT - REGEXP_LIKE ================================
    Daha karmaþýk pattern ile sorgulama iþlemi için REGEXP_LIKE kullanýlabilir. 
    Syntax:
    --------
    REGEXP_LIKE(sutun_adý, ‘pattern[] ’, ‘c’ ] )
           
========================================================================== */
CREATE TABLE kelimeler
    (
        id NUMBER(10) UNIQUE,
        kelime VARCHAR2(50) NOT NULL,
        harf_sayisi NUMBER(6)
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    SELECT * FROM kelýmeler;
    --ÝÇERÝSÝNDE 'HÝ' HARFLERÝ GEÇEN KELÝMELERÝ SORGULAYINIZ
    SELECT * FROM kelýmeler WHERE REGEXP_LIKE (kelime, 'hi');
    --içerisinde h veya i geçenleri bulmak için
    SELECT * FROM kelýmeler WHERE REGEXP_LIKE (kelime, '[hi]');
    --içerisinde ot veya at harfleri olan kelimeleri sorgula
    --veya ilemi | karakteri ile yapýlýr
    SELECT * FROM kelýmeler WHERE REGEXP_LIKE (kelime, ('ot|at|OT'));--regex case sensitive çalýþýr
    SELECT * FROM kelýmeler WHERE REGEXP_LIKE (kelime, ('ot|at'),'i');-- incase sensitive seçmek için 'i' kullandýk
    --hi veya ho ile baþlayan kelimeleri soorgulayýnýz
    --baþlama için ^ karakteri kullanýlýr
    SELECT * FROM kelýmeler WHERE REGEXP_LIKE (kelime, ('^hi|^ho'),'i');
    --bitiþ için $ iþareti kullanýlýr
    --t veye m ile biten kelimeleri incase olarak listele
    SELECT * FROM kelýmeler WHERE REGEXP_LIKE (kelime, ('t$|m$'),'i'); --biten dediðimiz için i$ yani sonuna koyuyoruz
    --h ile baþlayýp t ile biten 3 harfli kelimeleri incase olrak listele
    --[] tek bir karakter gösterir
    SELECT * FROM kelýmeler WHERE REGEXP_LIKE (kelime, ('^h[a-z0-9]t$'),'i');
    --lk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli
    --kelimelerin tüm bilgilerini sorgulayalým. 
    SELECT * FROM kelýmeler WHERE REGEXP_LIKE (kelime, ('^h[ai]t$'),'i');--[ai] a veya i demek
    --içerisinde m veya i veya e olan tüm kelimeleri listele
    SELECT * FROM kelýmeler WHERE REGEXP_LIKE (kelime, ('[mie]'),'i');
    SELECT * FROM kelýmeler WHERE REGEXP_LIKE (kelime, ('m|i|e'),'i'); 
    SELECT * FROM kelýmeler WHERE REGEXP_LIKE (kelime, ('[mie](*)'),'i');
    SELECT * FROM kelýmeler WHERE REGEXP_LIKE (kelime, ('[m,i,e]'),'i');
    --{2}
    --içerisinde en az 2 adet oo barýndýran kelimelerin tüm bilgilerini listeleyiniz
    SELECT * FROM kelýmeler WHERE REGEXP_LIKE (kelime, ('[o]{2}'),'i'); 
    SELECT * FROM kelýmeler WHERE REGEXP_LIKE (kelime, ('[a]{2}'),'i');
    

    
