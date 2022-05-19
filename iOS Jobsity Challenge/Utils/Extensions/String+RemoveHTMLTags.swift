//
//  String+RemoveHTMLTags.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 19/05/2022.
//

import Foundation


extension String {
    
    var withoutHTMLTags: String {
        let newString = self.replacingOccurrences(of: "<p>", with: "\n", options: .caseInsensitive, range: nil)
        return newString.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
