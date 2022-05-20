//
//  ModelDecodingTests.swift
//  iOS Jobsity ChallengeTests
//
//  Created by Cristian Carlassare on 19/05/2022.
//

import XCTest


class ModelDecodingTests: XCTestCase {

    func testSeriesDecoding() throws {
        let data = Data("{\"id\":1,\"name\":\"Under the Dome\",\"genres\":[\"Drama\",\"Science-Fiction\"],\"schedule\":{\"time\":\"22:00\",\"days\":[\"Thursday\"]},\"image\":{\"medium\":\"https://medium.series/image.jpg\",\"original\":\"https://original.series/image.jpg\"},\"summary\":\"A summary\"}".utf8)
        let decodedSerie = try? JSONDecoder().decode(Series.self, from: data)
        
        XCTAssertNotNil(decodedSerie)
        
        XCTAssertEqual(decodedSerie?.id, 1)
        XCTAssertEqual(decodedSerie?.name, "Under the Dome")
        XCTAssertEqual(decodedSerie?.genres, ["Drama", "Science-Fiction"])
        XCTAssertEqual(decodedSerie?.schedule?.time, "22:00")
        XCTAssertEqual(decodedSerie?.schedule?.days, ["Thursday"])
        XCTAssertEqual(decodedSerie?.image?.medium, "https://medium.series/image.jpg")
        XCTAssertEqual(decodedSerie?.image?.original, "https://original.series/image.jpg")
        XCTAssertEqual(decodedSerie?.summary, "A summary")
    }
    
    func testEpisodeDecoding() throws {
        let data = Data("{\"id\":1,\"name\":\"Pilot\",\"season\":1,\"number\":1,\"image\":{\"medium\":\"https://medium.episode/image.jpg\",\"original\":\"https://original.episode/image.jpg\"},\"summary\":\"A summary\"}".utf8)
        let decodedEpisode = try? JSONDecoder().decode(Episode.self, from: data)
        
        XCTAssertNotNil(decodedEpisode)
        
        XCTAssertEqual(decodedEpisode?.id, 1)
        XCTAssertEqual(decodedEpisode?.name, "Pilot")
        XCTAssertEqual(decodedEpisode?.season, 1)
        XCTAssertEqual(decodedEpisode?.number, 1)
        XCTAssertEqual(decodedEpisode?.image?.medium, "https://medium.episode/image.jpg")
        XCTAssertEqual(decodedEpisode?.image?.original, "https://original.episode/image.jpg")
        XCTAssertEqual(decodedEpisode?.summary, "A summary")
    }
}
