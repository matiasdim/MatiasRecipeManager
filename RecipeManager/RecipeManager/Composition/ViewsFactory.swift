//
//  ViewsFactory.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 3/02/23.
//

import UIKit

protocol ViewsFactory {
    func makeRecipesViewController(withSelectionAction action: @escaping (Int) -> Void) -> UIViewController
    func makeRecipeDetailViewController(forID id: Int) -> UIViewController
}
