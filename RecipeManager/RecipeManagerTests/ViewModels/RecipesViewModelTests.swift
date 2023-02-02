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
    
//    func test_viewModel_shouldInitWithEmptyRecipesByDefault() {
//        let sut = RecipesViewModel()
//
//        XCTAssertNil(sut.recipeID(at: 0))
//    }
    
//    func
    
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
    
    func test_recipeID_atIndex0_shouldBeCorrect() {
        let sut = RecipesViewModel(recipes: [recipe])
        
        XCTAssertEqual(sut.recipeID(at: 0), 1, "Wrong value reurned by recipeID method")
    }
    
    private let recipe = Recipe(id: 1, title: "Title", image: "", time: 192, servings: 5, sourceURL: "", summary: "This is the summary of the recipe", instructions: "The instructions of the recipe comes here")
}
