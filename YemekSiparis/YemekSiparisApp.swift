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

    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
