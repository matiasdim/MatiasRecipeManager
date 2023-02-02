//
//  RecipeDetailViewModelTests.swift
//  RecipeManagerTests
//
//  Created by Matías  Gil Echavarría on 1/02/23.
//

import XCTest
@testable import RecipeManager

final class RecipeDetailViewModelTests: XCTestCase {
    
    func test_viewController_shouldInitWithARecipe() {
        XCTAssertEqual(makeSUT(recipe: recipe).viewTitle, "Title")
    }
    
    func test_viewModel_withNoRecipe_shouldInitNoRecipe() {
        XCTAssertEqual(makeSUT().recipeTitle, "", "Expected empty property value but got different value")
    }

    func test_viewModel_shouldReturnViewTitle() {
        XCTAssertEqual(makeSUT(recipe: recipe).viewTitle, "Title", "Wrong ViewTitle value")
    }
    
    func test_viewModel_withNoRecipe_shouldHaveEmptyViewTitle() {
        XCTAssertEqual(makeSUT().viewTitle, "", "Expected empty property value but got different value")
    }
    
    func test_recipeTitle_shouldReturnRecipeTitle() {
        XCTAssertEqual(makeSUT(recipe: recipe).recipeTitle, "Title", "Wrong recipeTitle value")
    }
    
    func test_viewModel_withNoRecipe_shouldHaveEmptyRecipeTitle() {
        XCTAssertEqual(makeSUT().recipeTitle, "", "Expected empty property value but got different value")
    }
    
    func test_cookingTime_shouldReturnCookingTime() {
        XCTAssertEqual(makeSUT(recipe: recipe).cookingTime, "192", "Wrong cookingTime value")
    }
    
    func test_viewModel_withNoRecipe_shouldHaveEmptyCookingTime() {
        XCTAssertEqual(makeSUT().cookingTime, "", "Expected property value of 0 but got different value")
    }
    
    func test_numberOfServings_shouldReturnNumberOfServings() {
        XCTAssertEqual(makeSUT(recipe: recipe).numberOfServings, "5", "Wrong numberOfServings value")
    }
    
    func test_viewModel_withNoRecipe_shouldHaveEmptyNumberOfServings() {
        XCTAssertEqual(makeSUT().numberOfServings, "", "Expected property value of 0 but got different value")
    }
    
    func test_sourceURL_shouldReturnSourceURL() {
        XCTAssertEqual(makeSUT(recipe: recipe).sourceURL, "", "Wrong sourceURL value")
    }
    
    func test_viewModel_withNoRecipe_shouldHaveEmptySourceURL() {
        XCTAssertEqual(makeSUT().sourceURL, "", "Expected empty property value but got different value")
    }
    
    func test_summary_shouldReturnRecipeSummary() {
        XCTAssertEqual(makeSUT(recipe: recipe).summary, "This is the summary of the recipe", "Wrong summary value")
    }
    
    func test_viewModel_withNoRecipe_shouldHaveEmptySummary() {
        XCTAssertEqual(makeSUT().summary, "", "Expected empty property value but got different value")
    }
    
    func test_instructions_shouldReturnInstructions() {
        XCTAssertEqual(makeSUT(recipe: recipe).instructions,
                       "The instructions of the recipe comes here, The instructions of the recipe comes here The instructions of the recipe comes here The instructions of the recipe comes here, The instructions of the recipe comes here. The instructions of the recipe comes here The instructions of the recipe comes here The instructions of the recipe comes here, The instructions of the recipe comes here.",
                       "Wrong summary value")
    }
    
    func test_viewModel_withNoRecipe_shouldHaveEmptyInstructions() {
        XCTAssertEqual(makeSUT().instructions, "", "Expected empty property value but got different value")
    }
    
    // MARK: - private
    let recipe = Recipe(id: 1, title: "Title", image: "", time: 192, servings: 5, sourceURL: "", summary: "This is the summary of the recipe", instructions: "The instructions of the recipe comes here, The instructions of the recipe comes here The instructions of the recipe comes here The instructions of the recipe comes here, The instructions of the recipe comes here. The instructions of the recipe comes here The instructions of the recipe comes here The instructions of the recipe comes here, The instructions of the recipe comes here.")
    
    private func makeSUT(recipe: Recipe? = nil) -> RecipeDetailViewModel {
        return RecipeDetailViewModel(recipe: recipe)
    }
}
