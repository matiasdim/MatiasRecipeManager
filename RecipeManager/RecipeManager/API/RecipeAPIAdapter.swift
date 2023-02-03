//
//  RecipeAPIdapter.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 3/02/23.
//

import Foundation

struct RecipeAPIdapter: RecipeService {
    var api: RecipeAPI = RecipeAPI()
    
    func fetchRecipes() async throws -> [Recipe] {
        do {
            return try await api.fetchRecipes()
        } catch {
            throw error
        }
    }
    
    func fetchRecipeDetail(forID id: Int) async throws -> Recipe {
        do {
            return try await api.fetchRecipeDetail(forID: id)
        } catch {
            throw error
        }
    }
}
