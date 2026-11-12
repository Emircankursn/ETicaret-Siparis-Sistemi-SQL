select
s.SiparisId,
m.Ad+' '+m.Soyad as MusteriAdi,
m.Sehir,
s.SiparisTarihi,
s.SiparisDurumu,
s.ToplamTutar
from Siparisler s
INNER JOIN Musteriler m ON s.MusteriID = m.MusteriID
ORDER BY s.SiparisTarihi DESC;
select 
k.KategoriAdi ,
sum(sd.adet) as ToplamSatilanAdet,
sum(sd.Adet * sd.SatisFiyati) as ToplamCiro
from SiparisDetaylari sd
INNER JOIN Urunler u ON sd.UrunID = u.UrunID
INNER JOIN Kategoriler k ON u.KategoriId = k.KategoriId
INNER JOIN Siparisler s ON sd.SiparisID = s.SiparisID

WHERE s.SiparisDurumu <> 'Ýptal' -- Ýptal edilenleri ciroya katma
GROUP BY k.KategoriAdi
ORDER BY ToplamCiro DESC;
SELECT 
    m.MusteriID,
    m.Ad + ' ' + m.Soyad AS MusteriAdi,
	Count(s.SiparisId) as SiparisSayisi,
	ISNULL(SUM(s.ToplamTutar), 0) AS ToplamHarcama
	from Musteriler m
	Left Join Siparisler s on m.MusteriId = s.MusteriId and s.SiparisDurumu <> 'Ýptal'
	Group by m.MusteriId, m.Ad, M.Soyad
	Order by ToplamHarcama DESC;
	SELECT 
	u.urunAdi,
	k.kategoriId,
	u.StokMiktari,
	u.BirimFiyati
	from urunler u 
	Inner Join kategoriler k on u.kategoriId = k.kategoriId
	Where u.StokMiktari < 20
	Order by u.StokMiktari ASC;
