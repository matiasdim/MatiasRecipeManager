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
    
    var recipeSelectionAction: ((Int) -> Void)
    
    init(navController: UINavigationController, factory: ViewsFactory, recipeSelectionAction: @escaping ((Int) -> Void) = { _ in }) {
        self.factory = factory
        self.navController = navController
        self.recipeSelectionAction = recipeSelectionAction
    }
    
    func presentRecipesViewController() {
        recipeSelectionAction = { [weak self] id in
            self?.pushRecipeDetail(forID: id)
        }
        let recipesVC = factory.makeRecipesViewController(withSelectionAction: recipeSelectionAction)
        navController.pushViewController(recipesVC, animated: false)
    }
    
    func pushRecipeDetail(forID id: Int) {
        let recipeDetailVC = factory.makeRecipeDetailViewController(forID: id)
        navController.pushViewController(recipeDetailVC, animated: true)        
    }
}
