//
//  RecipeDetailViewModelTests.swift
//  RecipeManagerTests
//
//  Created by Matías  Gil Echavarría on 1/02/23.
//

import XCTest
@testable import RecipeManager

final class RecipeDetailViewModelTests: XCTestCase {
    var sut: RecipeDetailViewModel!
    
    override func setUp() {
        super.setUp()
        sut = RecipeDetailViewModel(recipe: recipe)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func test_viewController_shouldInitWithARecipe() {
        XCTAssertEqual(sut.recipe.title, "Title")
    }

    func test_viewModel_shouldHaveRecipeTitleAsTitlePropertyValue() {
        XCTAssertEqual(sut.viewTitle, "Title", "Wrong ViewTitle value")
    }
    
    func test_recipeTitle_shouldReturnRecipeTitle() {
        XCTAssertEqual(sut.recipeTitle, "Title", "Wrong recipeTitle value")
    }
    
    func test_cookingTime_shouldReturnRecipeTitle() {
        XCTAssertEqual(sut.cookingTime, 192, "Wrong cookingTime value")
    }
    
    func test_numberOfServings_shouldReturnRecipeTitle() {
        XCTAssertEqual(sut.numberOfServings, 5, "Wrong numberOfServings value")
    }
    
    func test_sourceURL_shouldReturnRecipeTitle() {
        XCTAssertEqual(sut.sourceURL, "", "Wrong sourceURL value")
    }
    
    func test_summary_shouldReturnRecipeTitle() {
        XCTAssertEqual(sut.summary, "This is the summary of the recipe", "Wrong summary value")
    }
    
    func test_instructions_shouldReturnRecipeTitle() {
        XCTAssertEqual(sut.instructions,
                       "The instructions of the recipe comes here, The instructions of the recipe comes here The instructions of the recipe comes here The instructions of the recipe comes here, The instructions of the recipe comes here. The instructions of the recipe comes here The instructions of the recipe comes here The instructions of the recipe comes here, The instructions of the recipe comes here.",
                       "Wrong summary value")
    }
    
    // MARK: - private
    let recipe = Recipe(id: 1, title: "Title", image: "", time: 192, servings: 5, sourceURL: "", summary: "This is the summary of the recipe", instructions: "The instructions of the recipe comes here, The instructions of the recipe comes here The instructions of the recipe comes here The instructions of the recipe comes here, The instructions of the recipe comes here. The instructions of the recipe comes here The instructions of the recipe comes here The instructions of the recipe comes here, The instructions of the recipe comes here.")
}
