//
//  UIViewController+Extensions.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 2/02/23.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        showDetailViewController(alert, sender: self)
    }
}
