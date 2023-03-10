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
    private var persitanceManager: PersistanceManager
    
    private var handlerSourceOfData: [Recipe] {
        isSearching ? filteredRecipes : recipes
    }
    
    private(set) var viewTitle = "Recipes"
    private(set) var searchBarPlaceholder = "Search..."
    
    var service: RecipeService
    var refreshData: (() -> Void)?
    var presentError: ((String) -> Void)?
    var isSearching = false
    var numbersOfSections: Int {
        return 1
    }
    
    init(recipes: [Recipe] = [],
         filteredRecipes: [Recipe] = [],
         service: RecipeService = RecipeAPIdapter(),
         persitanceManager: PersistanceManager = UserDefaultsManager()) {
        self.recipes = recipes
        self.filteredRecipes = filteredRecipes
        self.service = service
        self.persitanceManager = persitanceManager
    }
    
    func numbersOfRows(in section: Int = 0) -> Int {
        return handlerSourceOfData.count
    }
    
    func cellTitle(at index: Int) -> String? {
        return handlerSourceOfData.indices.contains(index) ? handlerSourceOfData[index].title : nil
    }
    
    func recipeID(at index: Int) -> Int? {
        return handlerSourceOfData.indices.contains(index) ? handlerSourceOfData[index].id : nil
    }
    
    func recipeImageURL(at index: Int) -> String? {
        return handlerSourceOfData.indices.contains(index) ? handlerSourceOfData[index].image : nil
    }
    
    func searchRecipes(searchText: String) {
        filteredRecipes = recipes.filter({ (item: Recipe) -> Bool in
            return item.title.lowercased().contains(searchText.lowercased())
        })
    }
    
    func manageRecipePersistance(byID id: Int) {
        if isSavedAsFavorite(byID: id) {
            removeFavorite(byID: id)
        } else {
            saveFavorite(byID: id)
        }        
    }
    
    func isSavedAsFavorite(byID id: Int) -> Bool {
        persitanceManager.isRecipePersisted(id: id) != 0        
    }
    
    @MainActor
    func fetchRecipes() {
        Task {
            do {
                recipes = try await service.fetchRecipes()
                refreshData?()
            } catch {
                presentError?(error.localizedDescription)
            }
        }
    }
    
    private func saveFavorite(byID id: Int) {
        persitanceManager.persistFavoriteRecipe(byID: id)
    }
    
    private  func removeFavorite(byID id: Int) {
        persitanceManager.removeFavoriteRecipe(byID: id)
    }
    
}
