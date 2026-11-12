USE ETicaretDB;
GO

-- 1. Müþterileri Ekle
INSERT INTO Musteriler (Ad, Soyad, Email, Sehir) VALUES
('Ahmet', 'Yýlmaz', 'ahmet.yilmaz@email.com', 'Ýstanbul'),
('Zeynep', 'Kaya', 'zeynep.kaya@email.com', 'Ankara'),
('Mehmet', 'Demir', 'mehmet.demir@email.com', 'Ýzmir'),
('Elif', 'Çelik', 'elif.celik@email.com', 'Antalya'),
('Can', 'Öztürk', 'can.ozturk@email.com', 'Ýstanbul');

-- 2. Kategorileri Ekle
INSERT INTO Kategoriler (KategoriAdi) VALUES
('Elektronik'),
('Bilgisayar & Bileþen'),
('Giyim'),
('Kitap & Kýrtasiye');

-- 3. Ürünleri Ekle (KategoriID sýrasýna göre: 1-Elektronik, 2-Bilgisayar, 3-Giyim, 4-Kitap)
INSERT INTO Urunler (KategoriID, UrunAdi, BirimFiyati, StokMiktari) VALUES
(1, 'Kablosuz Kulaklýk', 1450.00, 40),
(1, 'Akýllý Saat', 3200.00, 25),
(2, 'Mekanik Oyuncu Klavyesi', 2100.00, 15),
(2, 'Kablosuz Gaming Mouse', 1150.00, 30),
(2, '27 Ýnç IPS Monitör', 6500.00, 10),
(3, 'Oversize Siyah Hoodie', 750.00, 50),
(4, 'Veri Bilimi ve SQL Temelleri', 320.00, 100);

-- 4. Sipariþleri Ekle (Farklý tarihlerde ve durumlarda)
INSERT INTO Siparisler (MusteriID, SiparisTarihi, SiparisDurumu, ToplamTutar) VALUES
(1, '2026-10-05 14:30:00', 'Teslim Edildi', 3250.00), -- Ahmet: Klavye + Mouse
(2, '2026-10-12 09:15:00', 'Teslim Edildi', 6500.00), -- Zeynep: Monitör
(1, '2026-10-20 18:45:00', 'Teslim Edildi', 1450.00), -- Ahmet: Kulaklýk
(3, '2026-11-01 11:20:00', 'Kargoda', 1820.00),       -- Mehmet: 2 Hoodie + 1 Kitap
(4, '2026-11-08 16:00:00', 'Hazýrlanýyor', 3200.00),  -- Elif: Akýllý Saat
(5, '2026-11-10 21:10:00', 'Ýptal', 2100.00);         -- Can: Klavye (Ýptal edildi)

-- 5. Sipariþ Detaylarýný Ekle (Sepet içerikleri)
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, SatisFiyati) VALUES
(1, 3, 1, 2100.00), -- Sipariþ 1: 1x Klavye
(1, 4, 1, 1150.00), -- Sipariþ 1: 1x Mouse
(2, 5, 1, 6500.00), -- Sipariþ 2: 1x Monitör
(3, 1, 1, 1450.00), -- Sipariþ 3: 1x Kulaklýk
(4, 6, 2, 750.00),  -- Sipariþ 4: 2x Hoodie
(4, 7, 1, 320.00),  -- Sipariþ 4: 1x Kitap
(5, 2, 1, 3200.00), -- Sipariþ 5: 1x Akýllý Saat
(6, 3, 1, 2100.00); -- Sipariþ 6: 1x Klavye