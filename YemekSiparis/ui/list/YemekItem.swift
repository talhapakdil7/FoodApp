//
//  YemekItem.swift
//  YemekSiparis
//
//  Created by Talha Pakdil on 12.03.2026.
//

import SwiftUI



struct YemekItem: View {
    
    var yemek = yemekler()
    var vm = DetaySayfaViewModel()
    var genislik = 0.0
    
    var body: some View {
        
               VStack(spacing: 15)
               {
                   AsyncImage(url: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)")) { image in
                       image.resizable()
                    
                   }placeholder: {
                   ProgressView()
                   }
                   
                   Text("\(yemek.yemek_adi!)")
                       .font(.system(size: 24))
                       .foregroundColor(.black)
                   
                   
                   HStack{
                       
                       Text("\(yemek.yemek_fiyat!) ₺")
                           .font(.system(size: 24))
                           .foregroundColor(.black)
                           .padding([.leading,.bottom],8)
                       Spacer()
                       Text(Image(systemName: "plus"))
                           .padding(5)
                           .foregroundStyle(Color.white)
                           .background(Color.orange)
                           .cornerRadius(10)
                           .padding([.trailing,.bottom],8)
                           .onTapGesture {
                               print("sepete eklendi \(yemek.yemek_adi!)")
                               vm.SepeteEkle(yemek_adi: yemek.yemek_adi!, yemek_resim_adi: yemek.yemek_resim_adi!, yemek_fiyat: Int(yemek.yemek_fiyat!)!, yemek_siparis_adet: 1, kullanici_adi: "talha")
                           }
                           
                       
                   }
                   
               }.background(Rectangle().fill(Color.white).shadow(radius: 5))
    }
}


