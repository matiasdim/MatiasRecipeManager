//
//  RecipesViewControllerTests.swift
//  RecipeManagerTests
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import XCTest
@testable import RecipeManager

final class RecipesViewControllerTests: XCTestCase {

    func test_viewController_shouldInitWithProperViewModel() {
        XCTAssertNotNil(makeSUT().viewModel)
    }
    
    func test_viewController_shouldInitWithItemSelecionCallback() {
        XCTAssertNotNil(makeSUT().selection)
    }
    
    func test_viewController_shouldShowRecipesTitle() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.title, "Recipes", "RecipesViewController is not correct")
    }
    
    func test_tableViewNumberOfSections_shouldBe0() {
        XCTAssertEqual(makeSUT().tableView.numberOfSections, 0, "Number of sections is incorrect")
    }
    
    func test_tableViewWithoutData_numberOfRowsInSection0_shouldBe0() {
        let viewModel = TestableRecipesViewModel(recipes: [])
        let sut = RecipesViewController(viewModel: viewModel, selection: { _ in })
        XCTAssertEqual(sut.tableView(makeSUT().tableView, numberOfRowsInSection: 0), 0, "Numbers of rows for empty data is incorrect")
    }
    
    func test_tableViewWith2Elements_numberOfRowsInSection0_shouldBe2() {
        let viewModel = TestableRecipesViewModel(recipes: [Recipe(),
                                                          Recipe()])
        let sut = RecipesViewController(viewModel: viewModel, selection: { _ in })
        XCTAssertEqual(sut.tableView(makeSUT().tableView, numberOfRowsInSection: 0), 2, "Number of rows for 2 elements is incorrect")
    }
    
    // MARK: - Private helpers
    private func makeSUT(withRecipes recipes: [Recipe] = []) -> RecipesViewController {
        let viewModel = RecipesViewModel(recipes: recipes)
        return RecipesViewController(viewModel: viewModel, selection: { _ in })
    }
                          
    private class TestableRecipesViewModel: RecipesViewModel {
        var testArrayOfRecipes: [Recipe]
        
        override init(recipes: [Recipe]) {
            testArrayOfRecipes = recipes
            super.init(recipes: recipes)
        }
    }

}
