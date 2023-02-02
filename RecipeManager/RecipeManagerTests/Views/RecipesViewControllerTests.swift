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
        
        XCTAssertEqual(sut.title, "Recipes", "RecipesViewController is not correct")
    }
    
    func test_tableViewDelegateAndDataSOurce_shouldBeSet() {
        let sut = makeSUT()
        
        XCTAssertNotNil(sut.tableView.delegate)
        XCTAssertNotNil(sut.tableView.dataSource)
    }
    
    func test_tableViewNumberOfSections_shouldBe0() {
        XCTAssertEqual(makeSUT().tableView.numberOfSections, 1, "Number of sections is incorrect")
    }
    
    func test_tableViewWithoutData_numberOfRowsInSection0_shouldBe0() {
        let viewModel = RecipesViewModel()
        let sut = RecipesViewController(viewModel: viewModel, selection: { _ in })
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(numbersOfRows(in: sut.tableView, section: 0), 0, "Numbers of rows for empty data is incorrect")
    }
    
    func test_tableViewWith2Elements_numberOfRowsInSection0_shouldBe2() {
        let viewModel = RecipesViewModel(recipes: [recipe1, recipe2])
        let sut = RecipesViewController(viewModel: viewModel, selection: { _ in })
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(numbersOfRows(in: sut.tableView, section: 0), 2, "Number of rows for 2 elements is incorrect")
    }
    
    func test_tablewViewCellForRow0_shouldBeRecipeCellCell() {
        let sut = makeSUT(withRecipes: [recipe1])

        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0)) as? RecipeCell

        XCTAssertNotNil(cell, "Cell is not a RecipeCell")
    }
    
    func test_tablewViewCellForRow0_shouldHaveCorrectAttributeValuesConfigured() {
        let sut = makeSUT(withRecipes: [recipe1])
        
        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0)) as? RecipeCell
        
        XCTAssertEqual(cell?.titleLabel.text, "Test Title")
    }
    
    func test_didSelectRowAtRow0_shouldCallSelectionCallback() {
        XCTAssertEqual(selectedRecipeID(atRow: 0), 1, "didSelectAt action failed")
    }
    
    func test_didSelectRowAtRow_withNonExistingIndex_shouldDoNothing() {
        XCTAssertEqual(selectedRecipeID(atRow: 1), 0, "didSelectAt called and it was not expected")
    }
    
    // MARK: - Private helpers
    private let recipe1 = Recipe(id: 1, title: "Test Title", image: "", time: 192, servings: 5, sourceURL: "", summary: "This is the summary of the recipe", instructions: "The instructions of the recipe comes here")
    
    private let recipe2 = Recipe(id: 2, title: "Test Title 2", image: "", time: 192, servings: 5, sourceURL: "", summary: "This is the summary of the recipe", instructions: "The instructions of the recipe comes here")
    
    private func selectedRecipeID(atRow row: Int) -> Float {
        var selectedRecipeID: Float = 0
        let selectionCallback = { index in
            selectedRecipeID = index
        }
        let sut = makeSUT(withRecipes: [recipe1], selection: selectionCallback)
        sut.loadViewIfNeeded()
        
        didSelectRowAt(in: sut.tableView, indexPath: IndexPath(row: row, section: 0))
        
        return selectedRecipeID
    }
    
    private func makeSUT(withRecipes recipes: [Recipe] = [], selection : @escaping ((Float) -> ()) = { _ in }) -> RecipesViewController {
        let viewModel = RecipesViewModel(recipes: recipes)
        let sut = RecipesViewController(viewModel: viewModel, selection: selection)
        sut.loadViewIfNeeded()
        return sut
    }
}
