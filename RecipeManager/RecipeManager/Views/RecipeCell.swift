//
//  RecipeCell.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    static let className = String(describing: RecipeCell.self)
    
    var favoriteButtonAction: ((Int) -> Void)?
    var isFavorite: Bool = false
    private(set) var recipeID: Int = 0
    
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var recipeImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    func configure(id: Int, title: String?, image: UIImage = .remove, isFavorite: Bool) {
        self.isFavorite = isFavorite
        recipeID = id
        titleLabel.text = title
        recipeImageView.image = image
        selectionStyle = .none
        configureFavoriteButton()
    }
    
    @IBAction func favoriteButtonTappe(_ sender: Any) {
        isFavorite.toggle()
        favoriteButton.isSelected = isFavorite
        favoriteButtonAction?(recipeID)
//        configureFavoriteButton()
    }
    
    private func configureFavoriteButton() {
        favoriteButton.isSelected = isFavorite
        favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .selected)
        favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
//        favoriteButton.imageView?.image = UIImage(systemName: isFavorite ? "star.fill" : "star")
        layoutIfNeeded()
    }
}
