



import Foundation
import Alamofire
internal import Combine

class SepetSayfaViewModel:ObservableObject{
    
    
    @Published var sepettekilerListe = [sepet_yemekler]()
    @Published var sepetToplamı:Int = 0
    
    func SepettekileriGetir(){
        let url = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php"
        let params:Parameters = ["kullanici_adi":"talha"]
        
        AF.request(url,method: .post,parameters: params).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(sepetcevap.self, from: data)
                    
                    if let liste = cevap.sepet_yemekler{
                        
                        var toplam = 0
                        for item in liste {
                            let fiyat = Int(item.yemek_fiyat ?? "0") ?? 0
                            let adet = Int(item.yemek_siparis_adet ?? "0") ?? 0
                            toplam += fiyat * adet
                        }
                        DispatchQueue.main.async {
                            self.sepettekilerListe = liste
                            self.sepetToplamı = toplam
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    /// Sepetteki mevcut listeden toplam fiyatı hesaplar (API çağrısı yapmaz).
    func toplamFiyat() {
        var toplam = 0
        for item in sepettekilerListe {
            let fiyat = Int(item.yemek_fiyat ?? "0") ?? 0
            let adet = Int(item.yemek_siparis_adet ?? "0") ?? 0
            toplam += fiyat * adet
        }
        sepetToplamı = toplam
    }
    

}




