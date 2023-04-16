--PROJECT 1 DESTIANA FR --

select * from public.buyer

-- 1. Mencari produk keluaran 2015 ke atas --
SELECT * FROM public.produk 
	WHERE th_pembuatan >= 2015
	ORDER BY th_pembuatan ASC
	
-- 2. Menambah 1 data bid baru --
INSERT INTO public.buyer(id_buyer,id_user,id_produk,date_bid,bid_price,bid_status)
	VALUES(
		15,
		18,
		38,
		'2023-01-28',
		110000000,
		'sent'
	)

-- 3. Melihat mobil yang dijual 1 akun dari tanggal terbaru --
SELECT * FROM katalog 
	LEFT JOIN produk 
	ON katalog.id_produk = produk.id_produk
	WHERE id_user IN (3) 
	ORDER BY tgl_posting DESC
	
-- 4. Mencari mobil bekas termurah berdasarkan keyword --
SELECT * FROM produk
	WHERE model_mobil = 'Honda CR-V' 
	ORDER BY harga ASC
	
-- 5. Mencari mobil bekas berdasarkan sebuah id_kota,  jarak terdekat dihitung berdasarkan latitude longitude. 
-- Perhitungan jarak dapat dihitung menggunakan rumus jarak euclidean berdasarkan latitude dan longitude. --
sqrt(power(c1.latitude - c2.latitude, 2) + power(c1.longitude - c2.longitude, 2))

