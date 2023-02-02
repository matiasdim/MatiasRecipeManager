//
//  RecipesViewModel.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import Foundation

class RecipesViewModel {
    private var recipes: [Recipe]
    private var filteredRecipes: [Recipe]
    
    private var handlerSourceOfData: [Recipe] {
        isSearching ? filteredRecipes : recipes
    }
    
    private(set) var viewTitle = "Recipes"
    private(set) var searchBarPlaceholder = "Search..."
    
    var refreshData: (() -> Void)?
    var presentError: ((String) -> Void)?
    var isSearching = false
    var numbersOfSections: Int {
        return 1
    }
    
    init(recipes: [Recipe] = [], filteredRecipes: [Recipe] = []) {
        self.recipes = recipes
        self.filteredRecipes = filteredRecipes
        
        fetch()
    }
    
    func numbersOfRows(in section: Int = 0) -> Int {
        return handlerSourceOfData.count
    }
    
    func cellTitle(at index: Int) -> String? {
        return handlerSourceOfData.indices.contains(index) ? handlerSourceOfData[index].title : nil
    }
    
    func recipeID(at index: Int) -> Float? {
        return handlerSourceOfData.indices.contains(index) ? handlerSourceOfData[index].id : nil
    }
    
    func searchRecipes(searchText: String) {
        filteredRecipes = recipes.filter({ (item: Recipe) -> Bool in
            return item.title.lowercased().contains(searchText.lowercased())
        })
    }
    
    func fetch() {
        Task {
            do {
                let recipeResponse = try await NetworkManager().fetchRecipes()
                recipes = recipeResponse.resuls
                DispatchQueue.main.async { [weak self] in
                    self?.refreshData?()
                }
            } catch {
                DispatchQueue.main.async { [weak self] in
                    self?.presentError?(error.localizedDescription)
                }
            }
        }
    }
    
}
