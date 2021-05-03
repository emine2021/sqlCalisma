/*
======================= SELECT - REGEXP_LIKE ================================
    Daha karma��k pattern ile sorgulama i�lemi i�in REGEXP_LIKE kullan�labilir. 
    Syntax:
    --------
    REGEXP_LIKE(sutun_ad�, �pattern[] �, �c� ] )
           
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
    SELECT * FROM kel�meler;
    --��ER�S�NDE 'H�' HARFLER� GE�EN KEL�MELER� SORGULAYINIZ
    SELECT * FROM kel�meler WHERE REGEXP_LIKE (kelime, 'hi');
    --i�erisinde h veya i ge�enleri bulmak i�in
    SELECT * FROM kel�meler WHERE REGEXP_LIKE (kelime, '[hi]');
    --i�erisinde ot veya at harfleri olan kelimeleri sorgula
    --veya ilemi | karakteri ile yap�l�r
    SELECT * FROM kel�meler WHERE REGEXP_LIKE (kelime, ('ot|at|OT'));--regex case sensitive �al���r
    SELECT * FROM kel�meler WHERE REGEXP_LIKE (kelime, ('ot|at'),'i');-- incase sensitive se�mek i�in 'i' kulland�k
    --hi veya ho ile ba�layan kelimeleri soorgulay�n�z
    --ba�lama i�in ^ karakteri kullan�l�r
    SELECT * FROM kel�meler WHERE REGEXP_LIKE (kelime, ('^hi|^ho'),'i');
    --biti� i�in $ i�areti kullan�l�r
    --t veye m ile biten kelimeleri incase olarak listele
    SELECT * FROM kel�meler WHERE REGEXP_LIKE (kelime, ('t$|m$'),'i'); --biten dedi�imiz i�in i$ yani sonuna koyuyoruz
    --h ile ba�lay�p t ile biten 3 harfli kelimeleri incase olrak listele
    --[] tek bir karakter g�sterir
    SELECT * FROM kel�meler WHERE REGEXP_LIKE (kelime, ('^h[a-z0-9]t$'),'i');
    --lk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli
    --kelimelerin t�m bilgilerini sorgulayal�m. 
    SELECT * FROM kel�meler WHERE REGEXP_LIKE (kelime, ('^h[ai]t$'),'i');--[ai] a veya i demek
    --i�erisinde m veya i veya e olan t�m kelimeleri listele
    SELECT * FROM kel�meler WHERE REGEXP_LIKE (kelime, ('[mie]'),'i');
    SELECT * FROM kel�meler WHERE REGEXP_LIKE (kelime, ('m|i|e'),'i'); 
    SELECT * FROM kel�meler WHERE REGEXP_LIKE (kelime, ('[mie](*)'),'i');
    SELECT * FROM kel�meler WHERE REGEXP_LIKE (kelime, ('[m,i,e]'),'i');
    --{2}
    --i�erisinde en az 2 adet oo bar�nd�ran kelimelerin t�m bilgilerini listeleyiniz
    SELECT * FROM kel�meler WHERE REGEXP_LIKE (kelime, ('[o]{2}'),'i'); 
    SELECT * FROM kel�meler WHERE REGEXP_LIKE (kelime, ('[a]{2}'),'i');
    

    
