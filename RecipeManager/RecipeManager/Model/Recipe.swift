//
//  Recipe.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import Foundation

struct RecipesApiResponse: Decodable {
    let resuls: [Recipe]
}

struct Recipe: Decodable {
    let id: Float
    let title: String
    let image: String
    
    let time: Int?
    let servings: Int?
    let sourceURL: String?
    let summary: String?
    let instructions: String?
}
