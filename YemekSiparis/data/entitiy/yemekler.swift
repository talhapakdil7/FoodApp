




import Foundation

class yemekler : Identifiable, Codable {
    /// Identifiable uyumluluğu: UI'daki ForEach ve sheet(item:) çalışması için.
    var id: String { yemek_id ?? yemek_adi ?? "" }

    var yemek_id: String?
    var yemek_adi: String?
    var yemek_resim_adi: String?
    var yemek_fiyat: String?
    
   
    init(){
        
    }
    
    init(yemek_id: String, yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String) {
           self.yemek_id = yemek_id
           self.yemek_adi = yemek_adi
           self.yemek_resim_adi = yemek_resim_adi
           self.yemek_fiyat = yemek_fiyat
       }
}

