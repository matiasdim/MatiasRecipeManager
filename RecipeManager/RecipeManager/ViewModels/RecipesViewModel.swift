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
        
    var numbersOfSections: Int {
        return 1
    }
    
    init(recipes: [Recipe]) {
        self.recipes = recipes
    }
    
    func numbersOfRows(in section: Int = 0) -> Int {
        return recipes.count
    }
    
    func cellTitle(at index: Int) -> String {
        return recipes[index].title
    }
}
