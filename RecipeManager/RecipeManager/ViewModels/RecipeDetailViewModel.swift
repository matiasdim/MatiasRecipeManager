//
//  RecipeDetailView.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 1/02/23.
//

import Foundation

class RecipeDetailViewModel {
    private var recipe: Recipe?
    private let recipeID: Int?
    
    var dataReady: (() -> Void)?
    var presentError: ((String) -> Void)?
    var service: RecipeService
        
    init(recipe: Recipe? = nil, recipeID: Int? = nil, service: RecipeService = RecipeAPIdapter()) {
        self.recipe = recipe
        self.recipeID = recipeID
        self.service = service
    }
    
    var viewTitle: String {
        recipe?.title ?? "-"
    }
    
    var recipeTitle: String {
        recipe?.title ?? "-"
    }
    
    var cookingTime: String {
        if let cookingTime = recipe?.time {
            return "\(cookingTime)"
        }
        return "-"
    }
    
    var numberOfServings: String {
        if let servings = recipe?.servings {
            return "\(servings)"
        }
        return "-"
    }
    
    var sourceURL: String {
        recipe?.sourceURL ?? "-"
    }
    
    var summary: String {
        recipe?.summary ?? "-"
    }
    
    var instructions: String {
        recipe?.instructions ?? "-"
    }
    
    var image: String {
        recipe?.image ?? ""
    }
    
    func fetchRecipe() {
        if let recipeID = recipeID {
            Task {
                do {
                    let recipe = try await service.fetchRecipeDetail(forID: recipeID)
                    self.recipe = recipe
                    DispatchQueue.main.async { [weak self] in
                        self?.dataReady?()
                    }
                } catch {
                    DispatchQueue.main.async { [weak self] in
                        self?.presentError?(error.localizedDescription)
                    }
                }
            }
        }
    }
}
