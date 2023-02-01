//
//  RecipeDetailView.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 1/02/23.
//

import Foundation

class RecipeDetailViewModel {
    let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var viewTitle: String {
        self.recipe.title
    }
    
    var recipeTitle: String {
        self.recipe.title
    }
    
    var cookingTime: Int {
        self.recipe.time
    }
    
    var numberOfServings: Int {
        self.recipe.servings
    }
    
    var sourceURL: String {
        self.recipe.sourceURL
    }
    
    var summary: String {
        self.recipe.summary
    }
    
    var instructions: String {
        self.recipe.instructions
    }
}
