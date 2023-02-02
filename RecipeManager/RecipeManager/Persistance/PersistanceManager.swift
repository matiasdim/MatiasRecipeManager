//
//  PersistanceManager.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 2/02/23.
//

import Foundation

protocol PersistanceManager {
    func persistFavoriteRecipe(byID id: Int)
    func removeFavoriteRecipe(byID id: Int)
    func isRecipePersisted(id: Int) -> Int
}
