//
//  NavigationControllerRouterTests.swift
//  RecipeManagerTests
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import XCTest
@testable import RecipeManager

final class NavigationControllerRouterTests: XCTestCase {
    
    func test_NavigationControllerRouter_shouldInitWithViewsFactoryAndNavController() {
        let sut = NavigationControllerRouter(navController: UINavigationController(), factory: ViewControllerFactory())
                
        XCTAssertNotNil(sut.factory)
        XCTAssertNotNil(sut.navController)
    }
    
    func test_presentRecipesViewController_shouldPushRecipesViewController() {
        let sut = NavigationControllerRouter(navController: UINavigationController(), factory: ViewControllerFactory())
        
        XCTAssertEqual(sut.navController.viewControllers.count, 0)
        
        sut.presentRecipesViewController()
        exectureRunLoop()
        
        XCTAssertEqual(sut.navController.viewControllers.count, 1)
        XCTAssertNotNil(sut.navController.viewControllers.first as? RecipesViewController)
    }
    
    func test_presentRecipesViewController_shouldSetSelectionCallbackToPushRecipeDetail() {
        let sut = NavigationControllerRouter(navController: UINavigationController(), factory: ViewControllerFactory())
        
        XCTAssertEqual(sut.navController.viewControllers.count, 0)
        
        sut.presentRecipesViewController()
        exectureRunLoop()
        
        XCTAssertEqual(sut.navController.viewControllers.count, 1)
        
        sut.recipeSelectionAction(1)
        exectureRunLoop()
        
        XCTAssertEqual(sut.navController.viewControllers.count, 2, "selectionCallback was not called since no Vc ws pushed into the stack")
        XCTAssertNotNil(sut.navController.viewControllers.last as? RecipeDetailViewController)
    }
    
    func test_showRecipeDetail_showsPushRecipeDetailViewControllerAnimated() {
        let navigation = NavigationControllerSpy()
        let sut = NavigationControllerRouter(navController: navigation, factory: ViewControllerFactory())

        XCTAssertEqual(sut.navController.viewControllers.count, 0)
        XCTAssertFalse(navigation.lastVCPushedAnimated)

        sut.pushRecipeDetail(forID: 0)
        exectureRunLoop()

        XCTAssertEqual(sut.navController.viewControllers.count, 1)
        XCTAssertNotNil(sut.navController.viewControllers.last as? RecipeDetailViewController, "Expected RecipeDetailViewController but it failed")
        XCTAssertTrue(navigation.lastVCPushedAnimated)
    }
    
}


class NavigationControllerSpy : UINavigationController {
    private(set) var lastVCPushedAnimated: Bool = false
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        lastVCPushedAnimated = animated
    }
}
