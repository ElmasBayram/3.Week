--1.Soru
--“USA” ülkesine ait, 2009 yılı içerisinde oluşturulmuş tüm faturaların (Invoice) toplamını listeleyen bir sorgu yazınız.
--Tablo: invoince

SELECT SUM(total) AS toplam_fatura
FROM invoice
WHERE EXTRACT(YEAR FROM invoice_date) = 2009
  AND billing_country = 'USA';

--103.95 sonucu elde ettim

--2. soru
--Tüm parça (track) bilgilerini, bu parçaların ait olduğu playlisttrack ve playlist tablolarıyla birleştirerek(JOIN) listeleyen bir sorgu yazınız.
--Kullanılacak Tablolar:track,playlisttrack,playlist

SELECT 
    t.track_id, t.name AS track_name,
    pt.playlist_id AS playlisttrack_id, p.playlist_id
FROM 
    track t
INNER JOIN 
    playlisttrack pt ON t.track_id = pt.track_id
INNER JOIN 
    playlist p ON pt.playlist_id = p.playlist_id;
--elde ettigim tabloda 8715 rows var 
--track tablosundan id, name degerlerini aldim
--playlisttrack tablosundan alddigim id'yi playlisttrack_id olarak adlandirdim ki diger playlist_id kolonuyla karismasin
--2 tane inner join yaptim bunlardan ilki: playlisttrack_id ile track_id tablosunu birlestirmek digeri ise: playlist_id ile playlisttrack_id'yi birlestirmek icin



--3.Soru
--"Let There Be Rock" adlı albüme ait tüm parçaları (Track) listeleyen, sanatçı (Artist) bilgisini de içeren bir sorgu yazınız. Ayrıca, sonuçları parça süresi (milliseconds) büyükten küçüğe sıralayınız.
--Kullanılacak Tablolar:track,album,artist

SELECT 
    t.track_id, t.name AS track_name, 
    a.name AS artist_name, 
    t.milliseconds AS track_duration 
	FROM track t
INNER JOIN 
    album al ON t.album_id = al.album_id
INNER JOIN 
    artist a ON al.artist_id = a.artist_id
WHERE al.title = 'Let There Be Rock'
ORDER BY t.milliseconds DESC;

--Toplam 8 satir elde ettim. Track idleri: 20,17,15,19,22,18,21,16
--INNER JOIN ile tablolari birlestirdim ve album tablosundan adi eslesen sarkiyi aldim
--order by ile track tablosundaki milliseconds'i desc ile coktan aza siraladim





