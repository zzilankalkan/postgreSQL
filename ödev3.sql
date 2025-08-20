--Her ülke için kaç müşteri olduğunu listelenmiş ve müşteri sayısına göre büyükten küçüğe sıralandırılan sorgu.

SELECT 
    country AS ulke,
    COUNT(customer_id) AS musteri_sayisi  --her ülkenin müşteri sayısını hesaplar
FROM customer
GROUP BY country  --aynı ülkeye ait satırları gruplar
ORDER BY musteri_sayisi DESC; --en çok müşterisi olan ülkeyi en üstte gösterir.


--Her sanatçının toplam kaç albümü olduğunu listeleyen ve albüm sayısına göre azalan sıralandırılan sorgu.

SELECT 
    ar.name AS sanatci,
    COUNT(al.album_id) AS album_sayisi --sanatçının albüm sayısı bulunur
FROM artist ar
JOIN album al ON ar.artist_id = al.artist_id --artist ve album tabloları sanatçı ID’si üzerinden birleştirilir
GROUP BY ar.name  --sanatçı bazlı gruplama yapılır
ORDER BY album_sayisi DESC; --albüm sayısına göre azalan sıralama yapılır.


--En uzun süreye sahip ilk 10 parçayı, albüm ve sanatçı bilgisiyle listeleyen sorgu.

SELECT 
    t.name AS parca,
    t.milliseconds AS sure,
    al.title AS album,
    ar.name AS sanatci
FROM track t
JOIN album al ON t.album_id = al.album_id
JOIN artist ar ON al.artist_id = ar.artist_id
ORDER BY t.milliseconds DESC
LIMIT 10;

/*track - album - artist zinciriyle parça–albüm–sanatçı bağlantısı kurulur.
ORDER BY t.milliseconds DESC en uzun parçalardan başlatır.
LIMIT 10 sadece ilk 10 sonucu getirir.
