Create Table Musteriler(
MusteriID INT PRIMARY KEY IDENTITY(1,1),
Ad nvarchar(50) not null,
Soyad nvarchar(50) not null,
Email nvarchar(100) unique not null,
Sehir nvarchar(50),
KayitTarihi datetime default getdate()
);
Create Table Kategoriler(
KategoriId int primary Key identity(1,1),
KategoriAdi nvarchar (100) not null
);
Create Table Urunler(
KategoriId int foreign key references Kategoriler(KategoriId),
UrunID int primary key identity(1,1),
UrunAdi nvarchar(50) not null,
BirimFiyati decimal(10,2) not null,
StokMiktari int not null
);
Create Table Siparisler(
SiparisID int primary key identity(1,1),
MusteriId int foreign key references Musteriler(MusteriId),
SiparisTarihi Datetime default getdate(),
SiparisDurumu nvarchar(50) Default 'Hazýrlanýyor',
ToplamTutar decimal(10,2)
);
CREATE TABLE SiparisDetaylari (
    DetayID INT PRIMARY KEY IDENTITY(1,1),
    SiparisID INT FOREIGN KEY REFERENCES Siparisler(SiparisID),
    UrunID INT FOREIGN KEY REFERENCES Urunler(UrunID),
    Adet INT NOT NULL,
    SatisFiyati DECIMAL(10, 2) NOT NULL -- Ürünün o anki satýþ fiyatý
);