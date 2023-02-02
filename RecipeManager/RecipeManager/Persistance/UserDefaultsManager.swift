//
//  UserDefaultsManager.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 2/02/23.
//

import Foundation

struct UserDefaultsManager: PersistanceManager {
    
    func persistFavoriteRecipe(byID id: Int) {
        if isRecipePersisted(id: id) == 0 {
            UserDefaults.standard.set(id, forKey: "\(id)")
            UserDefaults.standard.synchronize()
        }
    }
    
    func removeFavoriteRecipe(byID id: Int) {
        if isRecipePersisted(id: id) != 0 {
            UserDefaults.standard.removeObject(forKey: "\(id)")
            UserDefaults.standard.synchronize()
        }
    }
    
    func isRecipePersisted(id: Int) -> Int {
        UserDefaults.standard.integer(forKey: "\(id)")
    }
}
