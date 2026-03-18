import Foundation
internal import Combine

/// Kullanıcı favorilerini cihazda saklar (UserDefaults).
/// API mantığına dokunmadan sadece UI/UX tarafında favori özelliği sağlar.
final class FavoritesStore: ObservableObject {
    static let shared = FavoritesStore()
    private init() {}

    private let storageKey = "foodapp_favorite_yemek_ids"

    @Published private(set) var favoriteIds: Set<String> = []

    func isFavori(_ yemek: yemekler) -> Bool {
        favoriteIds.contains(yemek.id)
    }

    func toggleFavori(_ yemek: yemekler) {
        let key = yemek.id
        if favoriteIds.contains(key) {
            favoriteIds.remove(key)
        } else {
            favoriteIds.insert(key)
        }
        save()
    }

    func setFavori(_ yemek: yemekler, favori: Bool) {
        let key = yemek.id
        if favori {
            favoriteIds.insert(key)
        } else {
            favoriteIds.remove(key)
        }
        save()
    }

    func load() {
        let defaults = UserDefaults.standard
        if let saved = defaults.array(forKey: storageKey) as? [String] {
            favoriteIds = Set(saved)
        }
    }

    private func save() {
        let defaults = UserDefaults.standard
        defaults.set(Array(favoriteIds), forKey: storageKey)
    }
}

