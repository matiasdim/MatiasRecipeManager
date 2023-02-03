//
//  ViewControllerFactory.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import Foundation
import UIKit

struct ViewControllerFactory: ViewsFactory {

    func makeRecipesViewController(withSelectionAction action: @escaping (Int) -> Void) -> UIViewController {
        let viewModel = RecipesViewModel(recipes: [])
        return RecipesViewController(viewModel: viewModel, selection: action)
    }
    
    func makeRecipeDetailViewController(forID id: Int) -> UIViewController {        
        return RecipeDetailViewController(viewModel: RecipeDetailViewModel(recipeID: id))
    }
    
}

