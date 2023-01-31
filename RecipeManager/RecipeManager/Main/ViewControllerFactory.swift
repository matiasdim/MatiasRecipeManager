//
//  ViewControllerFactory.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import Foundation
import UIKit

protocol ViewsFactory {
    func makeRecipesViewController() -> UIViewController
    func makeRecipeDetailViewController() -> UIViewController
}

struct ViewControllerFactory: ViewsFactory {

    func makeRecipesViewController() -> UIViewController {
        let selection: (Int) -> Void = { index in }
        let viewModel = RecipesViewModel(recipes: [])
        return RecipesViewController(viewModel: viewModel, selection: selection)
    }
    
    func makeRecipeDetailViewController() -> UIViewController {
        return RecipeDetailViewController()
    }
    
}

