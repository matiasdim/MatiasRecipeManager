//
//  RecipesViewModel.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import Foundation

class RecipesViewModel {
    private let recipes: [Recipe]
    
    private(set) var viewTitle = "Recipes"
    
    init(recipes: [Recipe]) {
        self.recipes = recipes
    }
    
    var numbersOfSections: Int {
        return 0
    }
    
    func numbersOfRows(in section: Int = 0) -> Int {
        return recipes.count
    }
}
