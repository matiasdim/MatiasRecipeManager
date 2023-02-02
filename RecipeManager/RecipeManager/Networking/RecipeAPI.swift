//
//  RecipeAPI.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 2/02/23.
//

import Foundation

struct RecipeAPI {
    var networkManager = NetworkManager()
    
    func fetchRecipes() async throws -> [Recipe] {
        do {
            let recipeResponse = try await networkManager.fetch(path: .list, decodableType: RecipesApiResponse.self)
            return recipeResponse.results
        } catch {
            throw error
        }
    }
    
    func fetchRecipeDetail(forID id: Int) async throws -> Recipe {
        do {
            let recipe = try await networkManager.fetch(path: .detail(id), decodableType: Recipe.self)
            return recipe
        } catch {
            throw error
        }
    }
}

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

protocol RecipeService {
    func fetchRecipes() async throws -> [Recipe]
    func fetchRecipeDetail(forID id: Int) async throws -> Recipe
}
