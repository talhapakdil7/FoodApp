import SwiftUI

struct DetaySayfa: View {
    var yemek: yemekler = yemekler()
    
    @Environment(\.dismiss) var dismiss
    @State private var adet = 2
    
     var viewmodel = DetaySayfaViewModel()
    
    var body: some View {
        VStack {
            
            // Üst bar
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                Text("Ürün Detayı")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    print("favori")
                } label: {
                    Image(systemName: "heart.fill")
                        .font(.title2)
                        .foregroundStyle(.gray)
                }
            }
            .padding()
            
            // Yıldızlar
            HStack(spacing: 6) {
                Image(systemName: "star.fill").foregroundStyle(.orange)
                Image(systemName: "star.fill").foregroundStyle(.orange)
                Image(systemName: "star.fill").foregroundStyle(.orange)
                Image(systemName: "star.fill").foregroundStyle(.orange)
                Image(systemName: "star").foregroundStyle(.gray)
            }
            .padding(.top, 10)
            
            Spacer()
            
            // Ürün görseli
            AsyncImage(url: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)")) { image in
                
                    image.scaledToFit()
                    
             
            }placeholder: {
            ProgressView()
            }
                
                
            
            Spacer()
            
            // Fiyat
            Text(yemek.yemek_fiyat!)
                .font(.system(size: 38, weight: .bold))
                .foregroundStyle(Color(red: 80/255, green: 90/255, blue: 180/255))
            
            // Başlık
            Text(yemek.yemek_adi!)
                .font(.system(size: 28, weight: .bold))
                .foregroundStyle(.black)
            
            // Adet alanı
            HStack(spacing: 28) {
                Button {
                    if adet > 1 {
                        adet -= 1
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(red: 80/255, green: 90/255, blue: 180/255))
                            .frame(width: 72, height: 60)
                        
                        Image(systemName: "minus")
                            .font(.title2)
                            .foregroundStyle(.white)
                    }
                }
                
                Text("\(adet)")
                    .font(.system(size: 28, weight: .bold))
                
                Button {
                    adet += 1
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(red: 80/255, green: 90/255, blue: 180/255))
                            .frame(width: 72, height: 60)
                        
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundStyle(.white)
                    }
                }
            }
            .padding(.top, 25)
            
            // Etiketler
            HStack(spacing: 12) {
                Text("25-35 dk")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Capsule())
                
                Text("Ücretsiz Teslimat")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Capsule())
                
                Text("İndirim %10")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Capsule())
            }
            .font(.system(size: 16))
            .padding(.top, 35)
            
            Spacer()
            
            // Alt alan
            HStack {
                Text("₺\(Int(yemek.yemek_fiyat!)! * adet)")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.black)
                
                Spacer()
                
                Button {
                    viewmodel.SepeteEkle(yemek_adi: yemek.yemek_adi!, yemek_resim_adi: yemek.yemek_resim_adi!, yemek_fiyat: Int(yemek.yemek_fiyat!)!, yemek_siparis_adet: adet, kullanici_adi: "talha")
                    
                    
                } label: {
                    Text("Sepete Ekle")
                        .font(.system(size: 22, weight: .medium))
                        .foregroundStyle(.white)
                        .frame(width: 230, height: 65)
                        .background(Color(red: 80/255, green: 90/255, blue: 180/255))
                        .clipShape(RoundedRectangle(cornerRadius: 22))
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 20)
        }
        .background(Color.white)
    }
}

#Preview {
    DetaySayfa()
}
