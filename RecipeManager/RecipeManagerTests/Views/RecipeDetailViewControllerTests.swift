//
//  RecipeDetailViewControllerTests.swift
//  RecipeManagerTests
//
//  Created by Matías  Gil Echavarría on 1/02/23.
//

import XCTest
@testable import RecipeManager

final class RecipeDetailViewControllerTests: XCTestCase {
    
    func test_viewControllerOutlets_shouldBeAllConnected() {
        let sut = RecipeDetailViewController(viewModel: RecipeDetailViewModel(recipe: recipe))
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.recipeImageView)
        XCTAssertNotNil(sut.titleLabel)
        XCTAssertNotNil(sut.recipeSummaryLabel)
        XCTAssertNotNil(sut.cookTimeLabel)
        XCTAssertNotNil(sut.servignsLabel)
        XCTAssertNotNil(sut.sourceURLLabel)
        XCTAssertNotNil(sut.InstructionsLabel)
    }
    
    func test_viewController_shouldHaveAViewModel() {
        let sut = RecipeDetailViewController(viewModel: RecipeDetailViewModel(recipe: recipe))
        
        XCTAssertNotNil(sut.viewModel)
    }
    
    // MARK: - Private helpers
    private let recipe = Recipe(id: 1, title: "Test Title", image: "", time: 192, servings: 5, sourceURL: "", summary: "This is the summary of the recipe", instructions: "The instructions of the recipe comes here")
}
