//
//  NetworkManager.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 1/02/23.
//

import Alamofire

struct NetworkManager {
    
    let baseURL = "https://api.spoonacular.com"
    let apiKey = "4a04bd5b48a041c49fd285e554cb1f79"
    
    enum APIPaths {
        case list
        case detail(Int)
        
        func value() -> String {
            switch self {
                case .list:
                    return "recipes/complexSearch"
                case .detail(let recipeID):
                    return "recipes/\(recipeID)/information"
            }
        }
    }
    
    func fetch(path: APIPaths) async throws -> RecipesApiResponse {
        //&number=20&offset=19
        do {
            let value = try await AF.request("\(baseURL)/\(path.value())?apiKey=\(apiKey)").serializingDecodable(RecipesApiResponse.self).value
            return value
        } catch {
            throw error
        }
    }
}
