//
//  RecipeCell.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import UIKit
import Kingfisher

class RecipeCell: UITableViewCell {
    
    static let className = String(describing: RecipeCell.self)
    
    var favoriteButtonAction: ((Int) -> Void)?
    var isFavorite: Bool = false
    private(set) var recipeID: Int = 0
    
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var recipeImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    func configure(id: Int, title: String?, imageURL: String, isFavorite: Bool) {
        self.isFavorite = isFavorite
        recipeID = id
        titleLabel.text = title
        selectionStyle = .none
        configureFavoriteButton()
        configureImage(imageURL: imageURL)
    }
    
    @IBAction func favoriteButtonTappe(_ sender: Any) {
        isFavorite.toggle()
        favoriteButton.isSelected = isFavorite
        favoriteButtonAction?(recipeID)
//        configureFavoriteButton()
    }
    
    private func configureImage(imageURL: String) {
        let url = URL(string: imageURL)
        recipeImageView.kf.indicatorType = .activity
        recipeImageView.kf.setImage(
            with: url,
            placeholder: UIImage(systemName: "camera.filters"),
            options: [
                .transition(.fade(1))                
            ])
    }
    
    private func configureFavoriteButton() {
        favoriteButton.isSelected = isFavorite
        favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .selected)
        favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
//        favoriteButton.imageView?.image = UIImage(systemName: isFavorite ? "star.fill" : "star")
        layoutIfNeeded()
    }
}
