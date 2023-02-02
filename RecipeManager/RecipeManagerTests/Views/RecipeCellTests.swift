//
//  RecipeCellTests.swift
//  RecipeManagerTests
//
//  Created by Matías  Gil Echavarría on 31/01/23.
//

import XCTest
@testable import RecipeManager

final class RecipeCellTests: XCTestCase {

    func test_className_shouldBeRecipeCellString() {
        XCTAssertEqual(RecipeCell.className, "RecipeCell")
    }
    
    func test_recipeCellOulets_shouldBeConnected() {
        let sut = makeSut()
        
        XCTAssertNotNil(sut?.titleLabel)
        XCTAssertNotNil(sut?.recipeImageView)
    }
    
    func test_recipeCell_shouldBeCorrectlyConfigured() {
        let sut = makeSut()
        
        sut?.configure(id: 1,
                       title: "Test Title",
                       imageURL: "https://upload.wikimedia.org/wikipedia/commons/c/c2/Escudo_del_Deportivo_Independiente_Medell%C3%ADn.png",
                       isFavorite: false)
        
        XCTAssertEqual(sut?.titleLabel.text, "Test Title", "Title Label configuration error")
    }

    // MARK: - Helpers
    private func makeSut() -> RecipeCell? {
        let bundle = Bundle(for: RecipeCell.self)
        guard let recipeCell = bundle.loadNibNamed("RecipeCell", owner: nil)?.first as? RecipeCell else {
            XCTFail("Failed to load RecipeCell nib", file: #file, line: #line)
            return nil
        }
        
        return recipeCell
    }
}
