//
//  ViewControllerFactory.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import Foundation
import UIKit

protocol ViewsFactory {
    func makeRecipesViewController(withSelectionAction action: @escaping (Int) -> Void) -> UIViewController
    func makeRecipeDetailViewController(forID id: Int) -> UIViewController
}

struct ViewControllerFactory: ViewsFactory {

    func makeRecipesViewController(withSelectionAction action: @escaping (Int) -> Void) -> UIViewController {
        let recipe1 = Recipe(id: 1, title: "Test Title", image: "https://spoonacular.com/productImages/432875-312x231.jpg", time: 192, servings: 5, sourceURL: "", summary: "This is the summary of the recipe", instructions: "The instructions of the recipe comes here")
        
        let recipe2 = Recipe(id: 2, title: "Test Title 2", image: "https://upload.wikimedia.org/wikipedia/commons/c/c2/Escudo_del_Deportivo_Independiente_Medell%C3%ADn.png", time: 192, servings: 5, sourceURL: "", summary: "This is the summary of the recipe", instructions: "The instructions of the recipe comes here")
        let viewModel = RecipesViewModel(recipes: [recipe1, recipe2])
        return RecipesViewController(viewModel: viewModel, selection: action)
    }
    
    func makeRecipeDetailViewController(forID id: Int) -> UIViewController {        
        return RecipeDetailViewController(viewModel: RecipeDetailViewModel(recipeID: id))
    }
    
}

