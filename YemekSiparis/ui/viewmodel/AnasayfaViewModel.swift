
//
//  AnasayfaViewModel.swift
//  YemekSiparis
//
//  Created by Kasım on 1.08.2024.
//

import Foundation
import Alamofire
internal import Combine

class AnasayfaViewModel : ObservableObject {
    
    @Published var yemeklerListesi = [yemekler]()
    
    func yemekleriYukle(){
        let url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php"
        
        AF.request(url,method: .get).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(yemeklercevap.self, from: data)
                    if let liste = cevap.yemekler {
                        DispatchQueue.main.async {
                            self.yemeklerListesi = liste
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
