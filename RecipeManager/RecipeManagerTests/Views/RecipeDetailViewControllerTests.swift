//
//  RecipeDetailViewControllerTests.swift
//  RecipeManagerTests
//
//  Created by Matías  Gil Echavarría on 1/02/23.
//

import XCTest
@testable import RecipeManager

final class RecipeDetailViewControllerTests: XCTestCase {
    var sut: RecipeDetailViewController!
    
    override func setUp() {
        super.setUp()
        sut = RecipeDetailViewController(viewModel: RecipeDetailViewModel(recipe: recipe))
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func test_viewControllerOutlets_shouldBeAllConnected() {
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.recipeImageView)
        XCTAssertNotNil(sut.titleLabel)
        XCTAssertNotNil(sut.recipeSummaryLabel)
        XCTAssertNotNil(sut.cookTimeLabel)
        XCTAssertNotNil(sut.servignsLabel)
        XCTAssertNotNil(sut.sourceURLLabel)
        XCTAssertNotNil(sut.instructionsLabel)
    }
    
    func test_viewController_shouldHaveAViewModel() {
        XCTAssertNotNil(sut.viewModel)
    }
    
    func test_titleLabelText_shouldBeCorrect() {
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.titleLabel.text, "Test Title", "Unexpected value for titleLabel")
    }
    
    func test_recipeSummaryLabelText_shouldBeCorrect() {
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.recipeSummaryLabel.text, "This is the summary of the recipe", "Unexpected value for recipeSummaryLabel")
    }
    
    func test_cookTimeLabelText_shouldBeCorrect() {
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.cookTimeLabel.text, "192", "Unexpected value for cookTimeLabel")
    }
    
    func test_servignsLabelText_shouldBeCorrect() {
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.servignsLabel.text, "5", "Unexpected value for servignsLabel")
    }
    
    func test_sourceURLLabelText_shouldBeCorrect() {
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.sourceURLLabel.text, "", "Unexpected value for sourceURLLabel")
    }
    
    func test_instructionsLabelText_shouldBeCorrect() {
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.instructionsLabel.text, "The instructions of the recipe comes here", "Unexpected value for instructionsLabel")
    }
    
    // MARK: - Private helpers
    private let recipe = Recipe(id: 1, title: "Test Title", image: "", time: 192, servings: 5, sourceURL: "", summary: "This is the summary of the recipe", instructions: "The instructions of the recipe comes here")
}
