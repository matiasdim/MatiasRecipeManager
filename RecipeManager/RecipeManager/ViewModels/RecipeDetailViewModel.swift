//
//  RecipeDetailView.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 1/02/23.
//

import Foundation

class RecipeDetailViewModel {
    private let recipe: Recipe?
        
    init(recipe: Recipe? = nil) {
        self.recipe = recipe
    }
    
    var viewTitle: String {
        recipe?.title ?? ""
    }
    
    var recipeTitle: String {
        recipe?.title ?? ""
    }
    
    var cookingTime: Int {
        recipe?.time ?? 0
    }
    
    var numberOfServings: Int {
        recipe?.servings ?? 0
    }
    
    var sourceURL: String {
        recipe?.sourceURL ?? ""
    }
    
    var summary: String {
        recipe?.summary ?? ""
    }
    
    var instructions: String {
        recipe?.instructions ?? ""
    }
}
