//
//  NavigationControllerFactory.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import UIKit

class NavigationControllerRouter {
    private(set) var navController: UINavigationController
    private(set) var factory: ViewsFactory
    
    var selectionCallback: ((Float) -> Void)?
    
    init(navController: UINavigationController, factory: ViewsFactory) {
        self.factory = factory
        self.navController = navController
    }
    
    func presentRecipesViewController() {
        selectionCallback = { [weak self] id in
            self?.pushRecipeDetail(forID: id)
        }
        let recipesVC = factory.makeRecipesViewController()
        navController.pushViewController(recipesVC, animated: false)
    }
    
    func pushRecipeDetail(forID id: Float) {
        let recipeDetailVC = factory.makeRecipeDetailViewController(forID: id)
        navController.pushViewController(recipeDetailVC, animated: true)        
    }
}
