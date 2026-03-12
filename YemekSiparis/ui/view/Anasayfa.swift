import SwiftUI

struct Anasayfa: View {
    init() {
        let navAppearance = UINavigationBarAppearance()
        navAppearance.backgroundColor = UIColor.systemIndigo
        navAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = navAppearance
        UINavigationBar.appearance().compactAppearance = navAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearance

        UISearchBar.appearance().barTintColor = .white
        UISearchBar.appearance().backgroundColor = .white
        UISearchBar.appearance().searchFieldBackgroundPositionAdjustment = UIOffset(horizontal: 0, vertical: 8)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [.foregroundColor: UIColor.black]
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(
            string: "Ara",
            attributes: [.foregroundColor: UIColor.gray]
        )
    }

    @StateObject private var viewModel = AnasayfaViewModel()
    @State private var aramaKelimesi = ""
    @State private var secilenYemek: yemekler? = nil

    var body: some View {
        GeometryReader { geometry in
            let ekranGenislik = geometry.size.width
            let itemGenislik = (ekranGenislik - 100) / 2

            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(viewModel.yemeklerListesi) { yemek in
                            Button {
                                secilenYemek = yemek
                            } label: {
                                YemekItem(yemek: yemek, genislik: itemGenislik)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(.top, 24)
                .navigationTitle("Yemekler")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("favoriler") {
                            print("favoriler tiklandi")
                        }
                        .foregroundStyle(.white)
                    }

                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            print("tıklandı ev")
                        } label: {
                            Image(systemName: "house")
                                .foregroundStyle(.white)
                        }
                    }
                }
                .onAppear {
                    viewModel.yemekleriYukle()
                }
                .searchable(text: $aramaKelimesi, prompt: "Yemek ara...")
                .sheet(item: $secilenYemek) { yemek in
                    DetaySayfa(yemek: yemek)
                }
            }
        }
    }
}

#Preview {
    Anasayfa()
}
