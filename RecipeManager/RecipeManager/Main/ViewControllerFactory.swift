//
//  ViewControllerFactory.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import Foundation
import UIKit

protocol ViewsFactory {
    func makeRecipesViewController(withSelectionAction action: @escaping (Float) -> Void) -> UIViewController
    func makeRecipeDetailViewController(forID id: Float) -> UIViewController
}

struct ViewControllerFactory: ViewsFactory {

    func makeRecipesViewController(withSelectionAction action: @escaping (Float) -> Void) -> UIViewController {
        let viewModel = RecipesViewModel()
        return RecipesViewController(viewModel: viewModel, selection: action)
    }
    
    func makeRecipeDetailViewController(forID id: Float) -> UIViewController {        
        return RecipeDetailViewController(viewModel: RecipeDetailViewModel())
    }
    
}

