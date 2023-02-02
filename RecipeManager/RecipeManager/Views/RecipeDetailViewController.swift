//
//  RecipeDetailViewController.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var recipeSummaryLabel: UILabel!
    @IBOutlet weak var cookTimeLabel: UILabel!
    @IBOutlet weak var servignsLabel: UILabel!
    @IBOutlet weak var sourceURLLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    private(set) var viewModel: RecipeDetailViewModel
    
    init(viewModel: RecipeDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = viewModel.viewTitle
        recipeSummaryLabel.text = viewModel.summary
        cookTimeLabel.text = viewModel.cookingTime
        servignsLabel.text = viewModel.numberOfServings
        sourceURLLabel.text = viewModel.sourceURL
        instructionsLabel.text = viewModel.instructions
    }

}
