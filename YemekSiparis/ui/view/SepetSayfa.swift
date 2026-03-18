//
//  SepetSayfa.swift
//  YemekSiparis
//
//  Created by Talha Pakdil on 12.03.2026.
//

import SwiftUI

struct SepetSayfa: View {
    
    @StateObject var viewModel = SepetSayfaViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            let ekranGenislik = geometry.size.width
            let itemGenislik = (ekranGenislik - 100) / 2

            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(viewModel.sepettekilerListe) { sepet in
                            SepetItem(sepetYemek: sepet, genislik: itemGenislik)
                        }
                        
                      
                            
                    }
                    
                }
                .padding(10)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack(spacing: 8) {
                            Image(systemName: "cart.fill")
                            Text("Sepetim")
                                .font(.system(size: 18, weight: .semibold))
                        }
                    }
                }
                .onAppear {
                    viewModel.SepettekileriGetir()
                }
                Spacer()
                VStack{
                    Text("toplam:\(viewModel.sepetToplamı)")
                        .font(.system(size: 22, weight: .medium))
                        .foregroundStyle(.white)
                        .frame(width: 230, height: 65)
                        .background(Color(red: 80/255, green: 90/255, blue: 180/255))
                        .clipShape(RoundedRectangle(cornerRadius: 22))
                }
           
               
                
            }
        }
    }
}

#Preview {
    SepetSayfa()
}
