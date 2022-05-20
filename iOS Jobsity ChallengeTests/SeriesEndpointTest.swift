//
//  SeriesEndpointTest.swift
//  iOS Jobsity ChallengeTests
//
//  Created by Cristian Carlassare on 19/05/2022.
//

import XCTest
@testable import iOS_Jobsity_Challenge


class SeriesEndpointTest: XCTestCase {

    func testGetSeriesEndpoint() throws {
        let seriesEndpoint = GetSeriesEndpoint()
        
        XCTAssertEqual(seriesEndpoint.baseURL, Constants.URL.tvMazeBaseURL)
        XCTAssertEqual(seriesEndpoint.path, Constants.URL.tvMazeSeriesEndpoint)
        XCTAssertEqual(seriesEndpoint.body, nil)
        XCTAssertEqual(seriesEndpoint.parameters, nil)
        XCTAssertEqual(seriesEndpoint.method, .get)
        XCTAssertEqual(seriesEndpoint.header, ["Content-Type": "application/json;charset=utf-8"])
    }
    
    func testGetSearchedSeriesEndpoint() throws {
        let seriesEndpoint = GetSearchedSeriesEndpoint()
        
        XCTAssertEqual(seriesEndpoint.baseURL, Constants.URL.tvMazeBaseURL)
        XCTAssertEqual(seriesEndpoint.path, Constants.URL.tvMazeSearchSeriesEndpoint)
        XCTAssertEqual(seriesEndpoint.body, nil)
        XCTAssertEqual(seriesEndpoint.parameters, nil)
        XCTAssertEqual(seriesEndpoint.method, .get)
        XCTAssertEqual(seriesEndpoint.header, ["Content-Type": "application/json;charset=utf-8"])
    }
}
