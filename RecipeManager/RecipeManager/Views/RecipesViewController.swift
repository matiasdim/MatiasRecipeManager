//
//  RecipesViewController.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import UIKit

class RecipesViewController: UIViewController {
    
    @IBOutlet private(set) weak var tableView: UITableView!
    
    private(set) var viewModel: RecipesViewModel
    private(set) var selection: (Float) -> Void
    
    init(viewModel: RecipesViewModel, selection: @escaping (Float) -> ()) {
        self.viewModel = viewModel
        self.selection = selection
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.viewTitle
        
        setupTable()
    }
    
    // MARK: - Private
    private func setupTable() {
        tableView.register(UINib(nibName: RecipeCell.className,
                                 bundle: nil),
                           forCellReuseIdentifier: RecipeCell.className)
    }
    
    private func configure(_ cell: RecipeCell, at index: Int) {
        let title = viewModel.cellTitle(at: index)
        cell.configure(title: title)
    }
}

extension RecipesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numbersOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numbersOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecipeCell.className) as? RecipeCell else {
            return RecipeCell()
        }
        
        configure(cell, at: indexPath.row)
        return cell
    }
        
}

extension RecipesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let recipeID = viewModel.recipeID(at: indexPath.row) else {
            return
        }
        
        selection(recipeID)
    }
}
    
