//
//  RecipeCell.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    static let className = String(describing: RecipeCell.self)
    
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var recipeImageView: UIImageView!

    func configure(title: String, image: UIImage = .remove) {
        titleLabel.text = title
        recipeImageView.image = image
    }
    
}
