# YemekSiparis (FoodApp)

SwiftUI ile yapılmış basit bir yemek siparişi uygulaması. Yemekleri listeler, detay sayfasından sepete ekler, sepetteki toplam fiyatı hesaplar ve favorileri (lokal) tutar.

## Özellikler
- Anasayfa: API’dan yemekleri çekme ve arama
- Detay: Ürün detayı, adet seçimi ve `Sepete Ekle`
- Sepetim: Sepetteki ürünleri listeleme ve toplam hesap
- Favoriler: `Kalp` ile favori ekleme/çıkarma ve ayrı favori ekranı (cihazda saklanır)

## Teknolojiler
- SwiftUI
- Alamofire (SPM ile)
- CoreData (proje içinde mevcut, ancak mevcut akışta aktif kullanılmıyor)
- UserDefaults (favoriler için)

## API
Uygulama, **internet üzerinden** uzaktaki sunucuya istek atıyor. (Base URL):
`http://kasimadalan.pe.hu/yemekler/`

- Yemekleri listeleme: `tumYemekleriGetir.php` (GET)
- Sepetteki yemekler: `sepettekiYemekleriGetir.php` (POST)
- Sepete ekleme: `sepeteYemekEkle.php` (POST)

## Ekran Görüntüleri
Simülatör ekran görüntüleri:

<p align="center">
  <img src="YemekSiparis/Simulator%20Screenshot%20-%20iphone%2015%20plus%20-%202026-03-19%20at%2001.26.19.png" width="32%" />
  <img src="YemekSiparis/Simulator%20Screenshot%20-%20iphone%2015%20plus%20-%202026-03-19%20at%2001.26.36.png" width="32%" />
  <img src="YemekSiparis/Simulator%20Screenshot%20-%20iphone%2015%20plus%20-%202026-03-19%20at%2001.26.40.png" width="32%" />
</p>

## ATS / HTTP
`Info.plist` içinde `NSAllowsArbitraryLoads = true` kullanıldığı için, **internet üzerinden HTTP** istekleri çalışıyor.


