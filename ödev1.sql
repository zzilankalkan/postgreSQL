SELECT COUNT(*)
FROM invoice
WHERE invoice_id IS NULL
  AND customer_id IS NULL
  AND invoice_date IS NULL
  AND billing_address IS NULL
  AND billing_city IS NULL
  AND billing_state IS NULL
  AND billing_country IS NULL
  AND billingpostal_code IS NULL
  AND total IS NULL;

  /* TOTAL ROWS: 0
  Bu sorgu invoice tablosundaki tüm alanları NULL olan kayıtları saymaktadır.
  Çıkan sonuç 0 olduğu için tabloda tüm alanları boş olan kayıt bulunmamaktadır. */


SELECT
  invoice_id,
  total AS old_total,
  total * 2 AS doubled_total
FROM invoice
ORDER BY doubled_total ASC;

	/*TOTAL ROWS: 412
	Bu sorguda total sütunu aynı SELECT içinde 2 ile çarpılarak yeni bir sütun (doubled_total) oluşturulur.
	ORDER BY doubled_total ile artan (ASC) sıralama yapılır. */


SELECT
  invoice_id,
  LEFT(billing_address, 3) || RIGHT(billing_address, 4) AS "Açık Adres",
  invoice_date
FROM invoice
WHERE invoice_date >= DATE '2013-10-01'
  AND invoice_date <  DATE '2013-11-01';

  /*TOTAL ROWS: 7
 	LEFT(billing_address, 3) soldan 3 karakter, RIGHT(billing_address, 4) sağdan 4 karakter alır.
	|| operatörü ile birleştirilir ve "Açık Adres" olarak isimlendirilir.
	Tarih aralığı 2013-10-01 dahil, 2013-11-01 hariç olacak şekilde ay filtresi uygulanır. */


  