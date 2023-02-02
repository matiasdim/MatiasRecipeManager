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
    
    private let recipe = Recipe(id: 1, title: "Title", image: "", time: 192, servings: 5, sourceURL: "", summary: "This is the summary of the recipe", instructions: "The instructions of the recipe comes here")
    
    private let recipe2 = Recipe(id: 2, title: "Title 2", image: "", time: 192, servings: 5, sourceURL: "", summary: "This is the summary of the recipe", instructions: "The instructions of the recipe comes here")
}
