//
//  RecipesViewModel.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import Foundation

class RecipesViewModel {
    private var recipes: [Recipe]
    private var filteredRecipes: [Recipe] = []
    
    private var handlerSourceOfData: [Recipe] {
        isSearching ? filteredRecipes : recipes
    }
    
    private(set) var viewTitle = "Recipes"
    
    private(set) var searchBarPlaceholder = "Search..."
    
    var isSearching = false
        
    var numbersOfSections: Int {
        return 1
    }
    
    init(recipes: [Recipe] = []) {
        self.recipes = recipes
    }
    
    func numbersOfRows(in section: Int = 0) -> Int {
        return handlerSourceOfData.count
    }
    
    func cellTitle(at index: Int) -> String? {
        return handlerSourceOfData.indices.contains(index) ? recipes[index].title : nil
    }
    
    func recipeID(at index: Int) -> Float? {
        return handlerSourceOfData.indices.contains(index) ? recipes[index].id : nil
    }
    
    func searchRecipes(searchText: String) {
        filteredRecipes = recipes.filter({ (item: Recipe) -> Bool in
            return item.title.lowercased().contains(searchText.lowercased())
        })
    }
    
}
