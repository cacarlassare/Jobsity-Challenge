//
//  UtilsTest.swift
//  iOS Jobsity ChallengeTests
//
//  Created by Cristian Carlassare on 19/05/2022.
//

import XCTest

class UtilsTest: XCTestCase {

    func testExample() throws {
        let htmlString = "<HTML>This is <p>a HTML string</p><HTML>"
        
        XCTAssertEqual(htmlString.withoutHTMLTags, "This is \na HTML string")
    }
}
