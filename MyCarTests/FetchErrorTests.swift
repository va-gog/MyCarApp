//
//  FetchErrorTests.swift
//  MyCarTests
//
//  Created by Gohar Vardanyan on 6/22/24.
//

import XCTest
@testable import MyCar

final class FetchErrorTests: XCTestCase {
    
    func testFetchErrorEquality() {
        // Given
        let error1 = FetchError.serialization
        let error2 = FetchError.serialization
        let error3 = FetchError.unknown
        let error4 = FetchError.unknown
        let error5 = FetchError.serviceError(NSError(domain: "Test", code: 1, userInfo: [NSLocalizedDescriptionKey: "Error 1"]))
        let error6 = FetchError.serviceError(NSError(domain: "Test", code: 1, userInfo: [NSLocalizedDescriptionKey: "Error 1"]))
        let error7 = FetchError.serviceError(NSError(domain: "Test", code: 1, userInfo: [NSLocalizedDescriptionKey: "Error 2"]))
        
        // Then
        XCTAssertEqual(error1, error2)
        XCTAssertEqual(error3, error4)
        XCTAssertEqual(error5, error6)
        XCTAssertNotEqual(error1, error3)
        XCTAssertNotEqual(error5, error7)
    }
    
    func testFetchErrorDescriptions() {
        // Given
        let error1 = FetchError.serialization
        let error2 = FetchError.unknown
        let error3 = FetchError.serviceError(NSError(domain: "Test", code: 1,
                                                     userInfo: [NSLocalizedDescriptionKey: "Error 1"]))
        
        // Then
        XCTAssertEqual(error1.description, FetchErrorDescriptions.serialization)
        XCTAssertEqual(error2.description, FetchErrorDescriptions.unknown)
        XCTAssertEqual(error3.description, "Error 1")
    }
    
    func testServiceErrorLocalizedDescriptionEquality() {
        // Given
        let nsError1 = NSError(domain: "Test", code: 1,
                               userInfo: [NSLocalizedDescriptionKey: "Error 1"])
        let nsError2 = NSError(domain: "Test", code: 1,
                               userInfo: [NSLocalizedDescriptionKey: "Error 2"])
        
        let error1 = FetchError.serviceError(nsError1)
        let error2 = FetchError.serviceError(nsError1)
        let error3 = FetchError.serviceError(nsError2)
        
        // Then
        XCTAssertEqual(error1, error2)
        XCTAssertNotEqual(error1, error3)
    }
}
