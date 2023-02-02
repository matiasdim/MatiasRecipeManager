//
//  String+Extensions.swift
//  RecipeManager
//
//  Created by Matías  Gil Echavarría on 2/02/23.
//

import Foundation

extension String {
    // DISCLAIMER!!
    // Extension taken from the internet. THIS IS NOT MINE AT ALL
    // Very useful to get rid of string that includes html tags
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data,
                                          options: [
                                            .documentType: NSAttributedString.DocumentType.html,
                                            .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
