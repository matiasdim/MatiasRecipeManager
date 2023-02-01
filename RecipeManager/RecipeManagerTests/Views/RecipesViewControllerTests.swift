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
        let viewModel = TestableRecipesViewModel(recipes: [])
        let sut = RecipesViewController(viewModel: viewModel, selection: { _ in })
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(numbersOfRows(in: sut.tableView, section: 0), 0, "Numbers of rows for empty data is incorrect")
    }
    
    func test_tableViewWith2Elements_numberOfRowsInSection0_shouldBe2() {
        let viewModel = TestableRecipesViewModel(recipes: [Recipe(id: 1, title: "Test Title", image: ""),
                                                          Recipe(id: 2, title: "Test Title 2", image: "")])
        let sut = RecipesViewController(viewModel: viewModel, selection: { _ in })
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(numbersOfRows(in: sut.tableView, section: 0), 2, "Number of rows for 2 elements is incorrect")
    }
    
    func test_tablewViewCellForRow0_shouldBeRecipeCellCell() {
        let sut = makeSUT(withRecipes: [Recipe(id: 1, title: "Test Title", image: "")])

        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0)) as? RecipeCell

        XCTAssertNotNil(cell, "Cell is not a RecipeCell")
    }
    
    func test_tablewViewCellForRow0_shouldHaveCorrectAttributeValuesConfigured() {
        let sut = makeSUT(withRecipes: [Recipe(id: 1, title: "Test Title", image: "")])
        
        let cell = cellForRow(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0)) as? RecipeCell
        
        XCTAssertEqual(cell?.titleLabel.text, "Test Title")
    }
    
    func test_didSelectRowAtRow0_shouldCallSelectedCallback() {
        var selectedIndex = -1
        let viewModel = RecipesViewModel(recipes: [Recipe(id: 1, title: "", image: "")])
        let sut = RecipesViewController(viewModel: viewModel, selection: { index in
            selectedIndex = index
        })
        sut.loadViewIfNeeded()
        
        didSelectRowAt(in: sut.tableView, indexPath: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(selectedIndex, 0, "didSelectAt action failed")
    }
    
    // MARK: - Private helpers
    private func makeSUT(withRecipes recipes: [Recipe] = []) -> RecipesViewController {
        let viewModel = RecipesViewModel(recipes: recipes)
        let sut = RecipesViewController(viewModel: viewModel, selection: { _ in })
        sut.loadViewIfNeeded()
        return sut
    }
                          
    private class TestableRecipesViewModel: RecipesViewModel {
        var testArrayOfRecipes: [Recipe]
        
        override init(recipes: [Recipe]) {
            testArrayOfRecipes = recipes
            super.init(recipes: recipes)
        }
    }

}
