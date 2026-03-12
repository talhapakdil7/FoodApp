//
//  SepetItem.swift
//  YemekSiparis
//

import SwiftUI

struct SepetItem: View {
    var sepetYemek: sepet_yemekler
    var genislik: CGFloat
    
    var body: some View {
        VStack(spacing: 15) {
            AsyncImage(url: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(sepetYemek.yemek_resim_adi ?? "")")) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 100)
            
            Text(sepetYemek.yemek_adi ?? "")
                .font(.system(size: 18))
                .foregroundColor(.black)
                .lineLimit(2)
            
            HStack {
                Text("\(sepetYemek.yemek_fiyat ?? "") ₺")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                
                Spacer()
                
                Text("Adet: \(sepetYemek.yemek_siparis_adet ?? "1")")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 8)
        }
        .padding(8)
        .background(Rectangle().fill(Color.white).shadow(radius: 5))
    }
}

#Preview {
    SepetItem(sepetYemek: sepet_yemekler(sepet_yemek_id: "1", yemek_adi: "Ayran", yemek_resim_adi: "ayran.png", yemek_fiyat: "30", yemek_siparis_adet: "2", kullanici_adi: "talha"), genislik: 150)
}
