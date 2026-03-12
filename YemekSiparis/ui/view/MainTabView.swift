import SwiftUI

struct MainTabView: View {
    
  
  
    
    var body: some View {
        TabView() {
            Anasayfa()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Anasayfa")
                }
            
           
            
            SepetSayfa()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Sepet")
                }
        }.tint(.indigo)
            .toolbarBackground(.white, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
    }
}
