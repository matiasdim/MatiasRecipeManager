//
//  RecipesViewModelTests.swift
//  RecipeManagerTests
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import XCTest
@testable import RecipeManager

final class RecipesViewModelTests: XCTestCase {

    func test_viewModel_shouldHaveRecipesAsTitlePropertyValue() {
        let sut = RecipesViewModel(recipes: [])
        
        XCTAssertEqual(sut.viewTitle, "Recipes", "Wrong ViewTitle value")
    }
    
    func test_viewModel_shouldHaveCorrectValueAsSearchBarPlaceholderPropertyValue() {
        let sut = RecipesViewModel(recipes: [])
        
        XCTAssertEqual(sut.searchBarPlaceholder, "Search...", "Wrong searchBarPlaceholder value")
    }
    
    func test_isSearching_shouldBeFalseByDefault() {
        let sut = RecipesViewModel(recipes: [recipe], filteredRecipes: [recipe2])
        
        XCTAssertFalse(sut.isSearching)
    }
    
    func test_viewModel_shouldInitWithEmptyRecipesByDefault() {
        let sut = RecipesViewModel(filteredRecipes: [recipe2])
        
        sut.isSearching = false
        
        XCTAssertNil(sut.recipeID(at: 0))
    }
    
    func test_viewModel_shouldInitWithEmptyFilteredRecipesArrayByDefault() {
        let sut = RecipesViewModel(recipes: [recipe])
        
        sut.isSearching = true
        
        XCTAssertNil(sut.recipeID(at: 0))
    }
    
    func test_handlerSourceOfData_whenIsNotSearching_shouldReturnRecipeArray() {
        /// recipes: Contains a recipe with id = 1
        /// filteredRecipes: Contains a recipe with id = 2
        let sut = RecipesViewModel(recipes: [recipe], filteredRecipes: [recipe2])
        
        sut.isSearching = false
        
        XCTAssertEqual(sut.recipeID(at: 0), 1)
    }
    
    func test_handlerSourceOfData_whenIsSearching_shouldReturnFilteredRecipesArray() {
        /// recipes: Contains a recipe with id = 1
        /// filteredRecipes: Contains a recipe with id = 2
        let sut = RecipesViewModel(recipes: [recipe], filteredRecipes: [recipe2])
        
        sut.isSearching = true
        
        XCTAssertEqual(sut.recipeID(at: 0), 2)
    }
    
    func test_viewModel_shouldInitWithRecipes() {
        let sut = RecipesViewModel(recipes: [recipe])
        
        XCTAssertNotNil(sut.recipeID(at: 0))
    }
    
    func test_numbersOfSections_shouldReturn1 () {
        let sut = RecipesViewModel(recipes: [])
        
        XCTAssertEqual(sut.numbersOfSections, 1)
    }
    
    func test_cellTitle_atIndex0_shouldBeCorrect() {
        let sut = RecipesViewModel(recipes: [recipe])
        
        XCTAssertEqual(sut.cellTitle(at: 0), "Title", "Wrong value reurned by cellTitle method")
    }
    
    func test_cellTitle_whenInvalidIndex_shouldBeNil() {
        let sut = RecipesViewModel(recipes: [recipe])
        
        XCTAssertNil(sut.cellTitle(at: 1), "Expected to be nil")
    }
    
    func test_recipeID_atIndex0_shouldBeCorrect() {
        let sut = RecipesViewModel(recipes: [recipe])
        
        XCTAssertEqual(sut.recipeID(at: 0), 1, "Wrong value reurned by recipeID method")
    }
    
    func test_recipeID_whenInvalidIndex_shouldBeNil() {
        let sut = RecipesViewModel(recipes: [recipe])
        
        XCTAssertNil(sut.recipeID(at: 1), "Expected to be nil")
    }
    
    func test_searchRecipes_shouldReturnRecipesWhenSearchMatchesRecipeTitle() {
        let sut = RecipesViewModel(recipes: [recipe], filteredRecipes: [])
        
        sut.isSearching = true
        sut.searchRecipes(searchText: "title")
        
        XCTAssertEqual(sut.recipeID(at: 0), 1)
    }
    
    func test_searchRecipes_shouldReturnRecipesWhenSearchPartiallyMatchesRecipeTitle() {
        let sut = RecipesViewModel(recipes: [recipe], filteredRecipes: [])
        
        sut.isSearching = true
        sut.searchRecipes(searchText: "tit")
        
        XCTAssertEqual(sut.recipeID(at: 0), 1)
    }
    
    func test_searchRecipes_shouldHaveEmptyRecipesWhenSearchDoesNotMatchRecipeTitle() {
        let sut = RecipesViewModel(recipes: [recipe], filteredRecipes: [])
        
        sut.isSearching = true
        sut.searchRecipes(searchText: "Whatever")
        
        XCTAssertNil(sut.recipeID(at: 0))
    }
    
    func test_isSavedAsFavorite_shouldCalliIsRecipePersisted_fromPersistanceManager() {
        let vm = PersistanceManagerStub()
        let sut = RecipesViewModel(persitanceManager: vm)
        
        XCTAssertFalse(vm.isRecipePersistedCalled)
        let _ = sut.isSavedAsFavorite(byID: 1)
        
        XCTAssertTrue(vm.isRecipePersistedCalled)
    }
    
    func test_manageRecipePersistance_shouldCallRemoveFavoriteFromPersistanceManager_whenRecipePersisted() {
        let vm = ExtraPersistanceManagerStub()
        let sut = RecipesViewModel(persitanceManager: vm)
        
        XCTAssertFalse(vm.isRemoveFavoriteRecipeCalled)
        vm.isRecipePersisted = 1
        let _ = sut.manageRecipePersistance(byID: 1)
        
        XCTAssertTrue(vm.isRemoveFavoriteRecipeCalled)
    }
    
    func test_manageRecipePersistance_shouldNotCallRemoveFavoriteFromPersistanceManager_whenRecipeNotPersisted() {
        let vm = ExtraPersistanceManagerStub()
        let sut = RecipesViewModel(persitanceManager: vm)
        
        XCTAssertFalse(vm.isRemoveFavoriteRecipeCalled)
        vm.isRecipePersisted = 0
        let _ = sut.manageRecipePersistance(byID: 1)
        
        XCTAssertFalse(vm.isRemoveFavoriteRecipeCalled)
    }
    
    func test_manageRecipePersistance_shouldCallSaveFavoriteFromPersistanceManager_whenNoRecipePersisted() {
        let vm = ExtraPersistanceManagerStub()
        let sut = RecipesViewModel(persitanceManager: vm)
        
        XCTAssertFalse(vm.isPersistFavoriteRecipeCalled)
        vm.isRecipePersisted = 0
        let _ = sut.manageRecipePersistance(byID: 1)
        
        XCTAssertTrue(vm.isPersistFavoriteRecipeCalled)
    }
    
    func test_manageRecipePersistance_shouldNotCallSaveFavoriteFromPersistanceManager_whenRecipePersisted() {
        let vm = ExtraPersistanceManagerStub()
        let sut = RecipesViewModel(persitanceManager: vm)
        
        XCTAssertFalse(vm.isPersistFavoriteRecipeCalled)
        vm.isRecipePersisted = 1
        let _ = sut.manageRecipePersistance(byID: 1)
        
        XCTAssertFalse(vm.isPersistFavoriteRecipeCalled)
    }
    
    private let recipe = Recipe(id: 1, title: "Title", image: "", time: 192, servings: 5, sourceURL: "", summary: "This is the summary of the recipe", instructions: "The instructions of the recipe comes here")
    
    private let recipe2 = Recipe(id: 2, title: "Title 2", image: "", time: 192, servings: 5, sourceURL: "", summary: "This is the summary of the recipe", instructions: "The instructions of the recipe comes here")
}

class PersistanceManagerStub: PersistanceManager {
    var isPersistFavoriteRecipeCalled = false
    var isRemoveFavoriteRecipeCalled = false
    var isRecipePersistedCalled = false
    
    var isRecipePersisted = 1
    
    func persistFavoriteRecipe(byID id: Int) {
        isPersistFavoriteRecipeCalled = true
    }
    
    func removeFavoriteRecipe(byID id: Int) {
        isRemoveFavoriteRecipeCalled = true
    }
    
    func isRecipePersisted(id: Int) -> Int {
        isRecipePersistedCalled = true
        return isRecipePersisted
    }
}

class ExtraPersistanceManagerStub: PersistanceManager {
    var isPersistFavoriteRecipeCalled = false
    var isRemoveFavoriteRecipeCalled = false
    
    var isRecipePersisted = 1
    
    func persistFavoriteRecipe(byID id: Int) {
        isPersistFavoriteRecipeCalled = true
    }
    
    func removeFavoriteRecipe(byID id: Int) {
        isRemoveFavoriteRecipeCalled = true
    }
    
    func isRecipePersisted(id: Int) -> Int {
        return isRecipePersisted
    }
}
