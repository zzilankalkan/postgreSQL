--Her albüm için parçaların ortalama süresini hesaplayan sorgu.

SELECT 
    al.album_id,                     -- Albümü benzersiz tanımlamak için ID
    al.title           AS album,     -- Albüm adı
    AVG(t.milliseconds)::INT 
        AS ortalama_sure_ms          -- Parçaların ortalama süresi (tam sayı görünmesi için INT'e döndürdük)
FROM album AS al                     -- Albüm tablosu ana çerçeve
JOIN track AS t                      -- Parçaları albüme bağla
  ON t.album_id = al.album_id        -- track - album ilişkisi
GROUP BY 
    al.album_id, al.title            -- Albüm bazında grupla
ORDER BY 
    ortalama_sure_ms DESC;           -- En uzun ortalamalı albümler üstte


--Her albümde en uzun süreye sahip parçayı bulan sorgu.

SELECT 
    al.album_id,                       -- Albümün ID’si
    al.title AS album,                 -- Albüm adı
    t.track_id,                        -- Parça ID’si
    t.name   AS parca,                 -- Parça adı
    t.milliseconds AS sure_ms          -- Parçanın süresi
FROM album al
JOIN track t 
  ON al.album_id = t.album_id          -- Track tablosunu albümle ilişkilendiriyoruz
WHERE t.milliseconds = (               -- Sadece en uzun parçayı seçmek için
    SELECT MAX(t2.milliseconds)        -- İlgili albümdeki en uzun süreyi bul
    FROM track t2
    WHERE t2.album_id = al.album_id    -- Aynı albüme ait parçalar içinde
);



--Fiyatı en yüksek 5 parça, albüm ve sanatçı ile birlikte veren sorgu.
SELECT
    t.track_id,                                 -- Parça ID
    t.name          AS parca,                   -- Parça adı
    t.unitprice     AS fiyat,                   -- Parça fiyatı
    al.title        AS album,                   -- Albüm adı
    ar.name         AS sanatci                  -- Sanatçı adı
FROM track  AS t
JOIN album  AS al 
  ON t.album_id = al.album_id                  
JOIN artist AS ar
  ON al.artist_id = ar.artist_id                
ORDER BY 
    t.unitprice DESC,                           -- En pahalıdan ucuza
    t.milliseconds DESC                         -- Fiyat eşitse daha uzun parça önce
LIMIT 5;                                        -- İlk 5 kayıt
