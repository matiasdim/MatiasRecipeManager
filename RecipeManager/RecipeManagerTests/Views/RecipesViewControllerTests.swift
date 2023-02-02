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
    
    func test_searchbarDelegate_shouldBeSet() {
        let sut = makeSUT()
        
        XCTAssertNotNil(sut.searchBar.delegate)
    }
    
    func test_fetchRecipes_shouldBeCalledWhenLoad() {
        let dummyVM = RecipesViewModelDummy()
        let sut = RecipesViewController(viewModel: dummyVM, selection: { _ in })
        
        XCTAssertFalse(dummyVM.fetchRecipesCalled)
        sut.loadViewIfNeeded()
        
        XCTAssertTrue(dummyVM.fetchRecipesCalled)
    }
    
    func test_bindViewModel_shouldSetRefreshDataBiding() {
        let dummyVM = RecipesViewModelDummy()
        let sut = RecipesViewController(viewModel: dummyVM, selection: { _ in })
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(dummyVM.refreshData)
    }
    
    func test_bindViewModel_shouldSetpresentErrorBiding() {
        let dummyVM = RecipesViewModelDummy()
        let sut = RecipesViewController(viewModel: dummyVM, selection: { _ in })
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(dummyVM.presentError)
    }
    
    func test_setupTableToRegisterCellNib_shouldBeCalledAfterViewLoads() {
        let sut = makeSUT()
        
        XCTAssertNotNil(sut.tableView.dequeueReusableCell(withIdentifier: RecipeCell.className))
    }
    
    func test_setupTable_shouldBeCalledAfterViewLoadsAndSetFavoriteActionProperty() {
        let dummyVM = RecipesViewModelDummy()
        let sut = RecipesViewController(viewModel: dummyVM, selection: { _ in })
        
        XCTAssertNil(sut.favoriteAction)
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.favoriteAction)
    }
    
    func test_configureSearchBar_shouldBeCalledAfterViewLoads() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.searchBar.placeholder, "Search...")
        XCTAssertTrue(sut.searchBar.showsCancelButton)
    }
    
    func test_configureSearchBar_shouldBeConfiguredAsTableHeaderView() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.tableView.tableHeaderView, sut.searchBar)
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
    
    func test_searchBarTextDidChange_withEmptyText_shouldChangeVMIsSearchingToFalse() {
        let sut = makeSUT()
        
        sut.viewModel.isSearching = true
        XCTAssertTrue(sut.viewModel.isSearching)
        
        textDidChange(in: sut.searchBar, text: "")
        
        XCTAssertFalse(sut.viewModel.isSearching)
    }
    
    func test_searchBarTextDidChange_withText_shouldChangeVMIsSearchingToTrue() {
        let sut = makeSUT()
        
        sut.viewModel.isSearching = false
        XCTAssertFalse(sut.viewModel.isSearching)
        
        textDidChange(in: sut.searchBar, text: "Searching test")
        
        XCTAssertTrue(sut.viewModel.isSearching)
    }
    
    func test_searchBarTextDidChange_withText_shoulCallSearchRecipesFromVM() {
        let spyVM = RecipesViewModelSpy()
        let sut = RecipesViewController(viewModel: spyVM, selection: { _ in })
        sut.loadViewIfNeeded()
        
        XCTAssertFalse(spyVM.searchRecipesCalled)
        textDidChange(in: sut.searchBar, text: "Searching test")
        
        XCTAssertTrue(spyVM.searchRecipesCalled)
    }
    
    func test_searchBarCancelButtonClicked_shouldEmptySearchText() {
        let sut = makeSUT()
        sut.searchBar.text = "search"
        
        XCTAssertEqual(sut.searchBar.text, "search")
        searchBarCancelButtonClicked(in: sut.searchBar)
        
        XCTAssertEqual(sut.searchBar.text, "")
    }
    
    func test_searchBarCancelButtonClicked_shouldSetVMisSearchingToFalse() {
        let sut = makeSUT()
        
        sut.viewModel.isSearching = true
        XCTAssertTrue(sut.viewModel.isSearching)
        
        searchBarCancelButtonClicked(in: sut.searchBar)
        
        XCTAssertFalse(sut.viewModel.isSearching)
    }
    
    func test_searchBarShouldBeginEditing_withTextSearch_shouldSetVMisSearchingToTrueAndReturnTrue() {
        let sut = makeSUT()
        
        sut.searchBar.text = "search"
        sut.viewModel.isSearching = false
        XCTAssertFalse(sut.viewModel.isSearching)
        
        guard let shouldBeginEditing = sut.searchBar.delegate?.searchBarShouldBeginEditing?(sut.searchBar) else {
            XCTFail("shouldBeginEditing should not be nil ")
            return
        }
        XCTAssertTrue(sut.viewModel.isSearching)
        XCTAssertTrue(shouldBeginEditing)
    }
    
    func test_searchBarShouldBeginEditing_withNoTextSearch_shouldReturnTrueAndNotAlterIsSearchValue() {
        let sut = makeSUT()
                
        sut.viewModel.isSearching = false
        XCTAssertFalse(sut.viewModel.isSearching)
        
        guard let shouldBeginEditing = sut.searchBar.delegate?.searchBarShouldBeginEditing?(sut.searchBar) else {
            XCTFail("shouldBeginEditing should not be nil ")
            return
        }
        XCTAssertFalse(sut.viewModel.isSearching)
        XCTAssertTrue(shouldBeginEditing)
    }
    
    func test_searchBarShouldBeginEditing_withEmptyTextSearch_shouldReturnTrueAndNotAlterIsSearchValue() {
        let sut = makeSUT()
        
        sut.searchBar.text = ""
        sut.viewModel.isSearching = false
        XCTAssertFalse(sut.viewModel.isSearching)
        
        guard let shouldBeginEditing = sut.searchBar.delegate?.searchBarShouldBeginEditing?(sut.searchBar) else {
            XCTFail("shouldBeginEditing should not be nil ")
            return
        }
        XCTAssertFalse(sut.viewModel.isSearching)
        XCTAssertTrue(shouldBeginEditing)
    }
    
    // MARK: - Private helpers
    private let recipe1 = Recipe(id: 1, title: "Test Title", image: "", time: 192, servings: 5, sourceURL: "", summary: "This is the summary of the recipe", instructions: "The instructions of the recipe comes here")
    
    private let recipe2 = Recipe(id: 2, title: "Test Title 2", image: "", time: 192, servings: 5, sourceURL: "", summary: "This is the summary of the recipe", instructions: "The instructions of the recipe comes here")
    
    private func selectedRecipeID(atRow row: Int) -> Int {
        var selectedRecipeID: Int = 0
        let selectionCallback = { index in
            selectedRecipeID = index
        }
        let sut = makeSUT(withRecipes: [recipe1], selection: selectionCallback)
        sut.loadViewIfNeeded()
        
        didSelectRowAt(in: sut.tableView, indexPath: IndexPath(row: row, section: 0))
        
        return selectedRecipeID
    }
    
    private func makeSUT(withRecipes recipes: [Recipe] = [], selection : @escaping ((Int) -> ()) = { _ in }) -> RecipesViewController {
        let viewModel = RecipesViewModel(recipes: recipes)
        let sut = RecipesViewController(viewModel: viewModel, selection: selection)
        sut.loadViewIfNeeded()
        return sut
    }
}

class RecipesViewModelSpy : RecipesViewModel {
    var searchRecipesCalled: Bool = false
    
    override func searchRecipes(searchText: String) {
        super.searchRecipes(searchText: searchText)
        searchRecipesCalled = true
    }
}

class RecipesViewModelDummy : RecipesViewModel {
    var fetchRecipesCalled = false
    @MainActor
    override func fetchRecipes() {
        fetchRecipesCalled = true
    }
    
}
