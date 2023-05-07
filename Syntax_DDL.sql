-- PROJECT 1 DESTIANA FR --

-- membuat type untuk tipe data enum --
CREATE type user_type as enum(
	'admin',
	'penjual',
	'buyer'
);

CREATE type bid_status as enum(
	'sent',
	'not sent'
);

CREATE type status_produk as enum(
	'sold',
	'ready'
);

-- membuat tabel pengguna --
CREATE TABLE pengguna
(
	id_user integer PRIMARY KEY not null,
	id_kota integer not null,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	phone_number numeric not null,
	user_type varchar(10) not null,
	alamat text not null,
	CONSTRAINT fk_id_kota
		FOREIGN KEY(id_kota)
		REFERENCES kota(id_kota)
);

-- mengubah tipe data pada kolom phone_number di tabel pengguna --
ALTER Table pengguna
ALTER COLUMN phone_number TYPE numeric

-- melihat seluruh kolom di tabel pengguna --
SELECT*FROM public.pengguna

-- membuat tabel produk --
CREATE TABLE produk
(
	id_produk integer PRIMARY KEY not null,
	merk_mobil varchar(50) not null,
	model_mobil varchar(50) not null,
	tipe_mobil varchar(50) not null,
	th_pembuatan int not null,
	harga numeric not null
);

-- menghapus tabel produk --
DROP TABLE produk

-- membuat tabel kota --
CREATE TABLE kota
(
	id_kota integer PRIMARY KEY not null,
	kota varchar(50) not null,
	latitude float not null,
	longitude float not null
);

-- mengubah tipe data kolom latitude dan longitude pada tabel kota --
ALTER TABLE kota
ALTER COLUMN latitude TYPE varchar(50)

ALTER TABLE kota
ALTER COLUMN longitude TYPE varchar(50)

-- membuat tabel buyer --
CREATE TABLE buyer
(
	id_buyer integer PRIMARY KEY not null,
	id_user integer not null,
	id_produk integer not null,
	date_bid date not null,
	bid_price numeric not null,
	bid_status varchar(10) not null,
	CONSTRAINT fk_id_user
		FOREIGN KEY(id_user)
		REFERENCES pengguna(id_user)
);

-- membuat tabel katalog --
CREATE TABLE katalog
(
	id_katalog integer PRIMARY KEY not null,
	id_user integer not null,
	id_produk integer not null,
	deskripsi_produk text,
	status_produk varchar(10) not null,
	CONSTRAINT fk_id_user
		FOREIGN KEY(id_user)
		REFERENCES pengguna(id_user),
	CONSTRAINT fk_id_produk
		FOREIGN KEY(id_produk)
		REFERENCES produk(id_produk)
);

-- menambah kolom baru pada tabel katalog --
ALTER TABLE katalog
ADD COLUMN tgl_posting date

-- update data pada kolom tgl_posting di tabel katalog --
UPDATE katalog SET tgl_posting = '2022-05-14' WHERE id_katalog = 1

UPDATE katalog SET tgl_posting = '2023-01-12' WHERE id_katalog = 2

UPDATE katalog SET tgl_posting = '2021-12-30' WHERE id_katalog = 3

UPDATE katalog SET tgl_posting = '2019-03-04' WHERE id_katalog = 4

UPDATE katalog SET tgl_posting = '2022-09-10' WHERE id_katalog = 5

		
