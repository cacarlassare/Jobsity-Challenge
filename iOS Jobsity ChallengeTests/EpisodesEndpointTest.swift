//
//  EpisodesEndpointTest.swift
//  iOS Jobsity ChallengeTests
//
//  Created by Cristian Carlassare on 17/05/2022.
//

import XCTest
@testable import iOS_Jobsity_Challenge


class EpisodesEndpointTest: XCTestCase {

    func testGetSeriesEndpoint() throws {
        let seriesEndpoint = GetEpisodesEndpoint(seriesID: 1)
        
        XCTAssertEqual(seriesEndpoint.baseURL, Constants.URL.tvMazeBaseURL)
        XCTAssertEqual(seriesEndpoint.path, Constants.URL.tvMazeEpisodesEndpoint(seriesID: 1))
        XCTAssertEqual(seriesEndpoint.body, nil)
        XCTAssertEqual(seriesEndpoint.parameters, nil)
        XCTAssertEqual(seriesEndpoint.method, .get)
        XCTAssertEqual(seriesEndpoint.header, ["Content-Type": "application/json;charset=utf-8"])
    }
}
