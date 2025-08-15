/*USA ülkesine ait 2009 yılı içerisindeki tüm faturaların toplamı */

SELECT SUM(total) AS toplam_tutar   /*faturaların toplam tutarını hesaplar*/
FROM invoice
WHERE billing_country = 'USA'       /*ülke filtresi yapılır.*/
  AND EXTRACT(YEAR FROM invoice_date) = 2009;     /*yalnızca 2009 yılına ait faturalar seçilir.*/

/*Tüm parçaları ait oldukları playlisttrack ve playlist tablosuyla birlikte listelenir */

SELECT t.track_id,
       t.name AS track_name,
       pt.playlist_id,
       p.name AS playlist_name
FROM track t
JOIN playlisttrack pt ON t.track_id = pt.track_id
JOIN playlist p ON pt.playlist_id = p.playlist_id;

/*track tablosu ile playlisttrack arasında track_id üzerinden INNER JOIN yapılır.
playlisttrack ile playlist arasında playlist_id üzerinden INNER JOIN yapılır.
böylece her parçanın hangi playlistte yer aldığı bilgisi alınır.*/

/* "Let There Be Rock" albümündeki tüm parçaları sanatçı bilgisiyle birlikte süreye göre büyükten küçüğe sıralanır.*/

SELECT t.track_id,
       t.name AS track_name,
       t.milliseconds,
       a.title AS album_title,
       ar.name AS artist_name
FROM track t
JOIN album a ON t.album_id = a.album_id
JOIN artist ar ON a.artist_id = ar.artist_id
WHERE a.title = 'Let There Be Rock'
ORDER BY t.milliseconds DESC;

/* track - album JOIN ile parçaların albüm bilgisi alınır.

album - artist JOIN ile albümün sanatçısı eklenir.

WHERE a.title = 'Let There Be Rock' filtresiyle sadece ilgili albüm seçilir.

ORDER BY t.milliseconds DESC ile parça süreleri büyükten küçüğe sıralanır. */



