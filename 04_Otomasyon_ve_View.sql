Create View vw_YoneticiSatisOzeti as
Select
S.SiparisId,
s.SiparisTarihi,
m.Ad+' '+m.Soyad as MusteriAdi,
m.Sehir,
k.kategoriAdi,
u.UrunAdi,
sd.adet,
sd.SatisFiyati,
(sd.SatisFiyati * sd.adet) as SatirToplami,
s.SiparisDurumu
from siparisdetaylari sd
Inner Join Siparisler s on s.SiparisId = sd.SiparisId
Inner Join Musteriler m on m.MusteriId = s.musteriId
Inner Join urunler u on u.UrunId = sd.urunId
Inner Join kategoriler k on k.kategoriId = u.kategoriId
Create Trigger trg_SiparisSonrasiStokDusus 
on SiparisDetaylari
After Insert
as
begin
set nocount on;
update u
set u.stokmiktari = u.stokmiktari- i.adet
from urunler u 
Inner Join inserted i on u.urunId = i.UrunId;
End;
go
INSERT INTO Siparisler (MusteriID, SiparisDurumu, ToplamTutar) VALUES (2, 'Hazýrlanýyor', 4350.00);
INSERT INTO SiparisDetaylari (SiparisID, UrunID, Adet, SatisFiyati) VALUES (SCOPE_IDENTITY(), 1, 3, 1450.00);
SELECT UrunID, UrunAdi, StokMiktari FROM Urunler WHERE UrunID = 1;