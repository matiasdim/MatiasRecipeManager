//
//  NetworkManager.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 1/02/23.
//

import Alamofire
import Foundation
import UIKit

struct NetworkManager {
    
    let baseURL = "https://api.spoonacular.com"
    let apiKey = "327ce78508e140a4a44d3877f4b18433"//"4a04bd5b48a041c49fd285e554cb1f79"
    
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
    
    func fetch<T: Decodable>(path: APIPaths, decodableType: T.Type) async throws -> T {
        //&number=20&offset=19
        do {
            let value = try await AF.request("\(baseURL)/\(path.value())?apiKey=\(apiKey)").serializingDecodable(T.self).value
            return value
        } catch {
            throw error
        }
    }
}
