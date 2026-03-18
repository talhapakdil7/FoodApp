import SwiftUI

struct FavorilerSayfa: View {
    @EnvironmentObject private var favorites: FavoritesStore

    /// Anasayfa'daki API listesini kullanır; favori ids'e göre filtreler.
    let yemeklerListesi: [yemekler]

    @State private var secilenYemek: yemekler? = nil

    private var favoriYemekler: [yemekler] {
        yemeklerListesi.filter { favorites.isFavori($0) }
    }

    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationStack {
            Group {
                if favoriYemekler.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "heart.slash")
                            .font(.system(size: 44))
                            .foregroundStyle(.gray)
                        Text("Favori yemeğiniz yok")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(favoriYemekler) { yemek in
                                VStack(spacing: 12) {
                                    AsyncImage(
                                        url: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi ?? "")")
                                    ) { image in
                                        image.resizable()
                                            .scaledToFit()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(height: 120)

                                    Text(yemek.yemek_adi ?? "")
                                        .font(.system(size: 16, weight: .semibold))
                                        .lineLimit(2)
                                        .multilineTextAlignment(.center)

                                    Text("\(yemek.yemek_fiyat ?? "") ₺")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundStyle(.gray)

                                    HStack(spacing: 10) {
                                        Button {
                                            favorites.setFavori(yemek, favori: false)
                                        } label: {
                                            Image(systemName: "heart.fill")
                                                .font(.system(size: 18))
                                                .foregroundStyle(.red)
                                        }
                                        .buttonStyle(.plain)

                                        Spacer()

                                        Button {
                                            secilenYemek = yemek
                                        } label: {
                                            Text("Detay")
                                                .font(.system(size: 14, weight: .medium))
                                                .foregroundStyle(.white)
                                                .frame(width: 96, height: 36)
                                                .background(Color(red: 80/255, green: 90/255, blue: 180/255))
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                        }
                                        .buttonStyle(.plain)
                                    }
                                    .padding(.top, 4)
                                }
                                .padding(12)
                                .background(Rectangle().fill(Color.white).shadow(radius: 5))
                            }
                        }
                        .padding(.top, 16)
                        .padding(.horizontal, 14)
                    }
                }
            }
            .navigationTitle("Favoriler")
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(item: $secilenYemek) { yemek in
            DetaySayfa(yemek: yemek)
        }
    }
}

#Preview {
    FavorilerSayfa(yemeklerListesi: [])
}

