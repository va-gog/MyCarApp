//
//  CarDataFetchServiceTests.swift
//  MyCarTests
//
//  Created by Gohar Vardanyan on 6/22/24.
//

import Foundation
import XCTest
@testable import MyCar

final class CarDataFetchServiceTests: XCTestCase {
    private var service: MockFetchService!
    private var sut: CarDataFetchModel!

    override func setUp() {
        super.setUp()
        service = MockFetchService()
        sut = CarDataFetchModel(fetchService: service)
    }

    override func tearDown() {
        sut = nil
        service = nil
        super.tearDown()
    }
    
    func testFetchDataForCarThrowsSerializationErrorWhenDataIsInvalid() async {
        // Given
        let invalidJSONData = "Invalid JSON".data(using: .utf8)!
        let url = URL(fileURLWithPath: "/path/to/invalid.json")
        
        service.result = .success(invalidJSONData)
        // When & Then
        do {
            _ = try await sut.fetchDataFor("", url: url)
            XCTFail("Expected to throw FetchError.serialization")
        } catch let error as FetchError {
            XCTAssertEqual(error, .serialization)
        } catch {
            XCTFail("Expected to throw FetchError.serialization, but threw \(error)")
        }
    }
    
    func testFetchDataForCarThrowsSerializationErrorWhenNoCarKeyInJSON() async {
        // Given
        let validJSONWithoutCarKey = """
        {
            "notCar": {
                "name": "Test Car",
                "model": "Model S"
            }
        }
        """.data(using: .utf8)!
        service.result = .success(validJSONWithoutCarKey)
        let url = URL(fileURLWithPath: "/path/to/noCarKey.json")
        
        // When & Then
        do {
            _ = try await sut.fetchDataFor("", url: url)
            XCTFail("Expected to throw FetchError.serialization")
        } catch let error as FetchError {
            XCTAssertEqual(error, .serialization)
        } catch {
            XCTFail("Expected to throw FetchError.serialization, but threw \(error)")
        }
    }

    func testFetchDataForCarThrowsServiceError() async {
        // Given
        let serviceError = NSError(domain: "Test", code: -1, userInfo: nil)
        service.result = .failure(serviceError)
        let url = URL(fileURLWithPath: "/path/to/valid.json")
        
        // When & Then
        do {
            _ = try await sut.fetchDataFor("", url: url)
            XCTFail("Expected to throw FetchError.serialization")
        } catch let error as FetchError {
            XCTAssertEqual(error, .serialization)
        } catch {
            XCTFail("Expected to throw FetchError.serialization, but threw \(error)")
        }
    }
}
