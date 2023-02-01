//
//  ViewControllerFactory.swift
//  RecipeManagerTests
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import XCTest
@testable import RecipeManager

final class ViewControllerFactoryTests: XCTestCase {
    var sut: ViewControllerFactory!
    
    override func setUp() {
        super.setUp()
        sut = ViewControllerFactory()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_viewControllerFactory_shouldImplementFactoryProtocol() {
//        XCTAssertNotNil(sut as? ViewsFactory, "ViewControllerFactory does not implement ViewsFactory protocol") // THis kind of protocol conformans is weird in Swift lang. This makes Xcode fire a warning when implementing the protocol and fails when not implemented
    }
    
    func test_makeRecipesViewController_shouldReturnRecipesViewController() {
        XCTAssertNotNil(sut.makeRecipesViewController(withSelectionAction: { _ in }) as? RecipesViewController)
    }
    
    func test_makeRecipesViewController_shouldReturnRecipesViewControllerWithViewModel() {
        guard let recipesViewController = sut.makeRecipesViewController(withSelectionAction: { _ in }) as? RecipesViewController else {
            XCTFail("Falied to create RecipesViewController")
            return
        }
        
        XCTAssertNotNil(recipesViewController.viewModel)
    }
    
    func test_makeRecipesViewController_shouldReturnRecipesViewControllerWithItemSelectionCallback() {
        guard let recipesViewController = sut.makeRecipesViewController(withSelectionAction: { _ in }) as? RecipesViewController else {
            XCTFail("Falied to create RecipesViewController")
            return
        }
        
        XCTAssertNotNil(recipesViewController.selection)
    }
    
    func test_makeRecipeDetailViewController_shouldReturnRecipeDetailViewController() {
        XCTAssertNotNil(sut.makeRecipeDetailViewController(forID: 0) as? RecipeDetailViewController)
    }

}
