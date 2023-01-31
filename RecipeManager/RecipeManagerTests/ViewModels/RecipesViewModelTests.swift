//
//  RecipesViewModelTests.swift
//  RecipeManagerTests
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import XCTest
@testable import RecipeManager

final class RecipesViewModelTests: XCTestCase {

    func test_viewModel_shouldHveRecipesAsTitlePropertyValue() {
        let sut = RecipesViewModel(recipes: [])
        
        XCTAssertEqual(sut.viewTitle, "Recipes")
    }

}
