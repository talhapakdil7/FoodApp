//
//  YemekSiparisApp.swift
//  YemekSiparis
//
//  Created by Talha Pakdil on 12.03.2026.
//

import SwiftUI
import CoreData

@main
struct YemekSiparisApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var favorites = FavoritesStore.shared

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(favorites)
                .onAppear {
                    favorites.load()
                }
        }
    }
}
