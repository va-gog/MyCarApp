//
//  FetchStateTests.swift
//  MyCarTests
//
//  Created by Gohar Vardanyan on 6/22/24.
//

import XCTest
@testable import MyCar

final class FetchStateTests: XCTestCase {

    func testFetchStateLoadingEquality() {
        // Given
        let state1 = FetchState.loading
        let state2 = FetchState.loading
        
        // Then
        XCTAssertEqual(state1, state2)
    }

    func testFetchStateFinishedEquality() {
        // Given
        let state1 = FetchState.finished
        let state2 = FetchState.finished
        
        // Then
        XCTAssertEqual(state1, state2)
    }

    func testFetchStateErrorEquality() {
        // Given
        let error1 = FetchError.serialization
        let error2 = FetchError.serialization
        let state1 = FetchState.error(error1)
        let state2 = FetchState.error(error2)
        
        // Then
        XCTAssertEqual(state1, state2)
    }

    func testFetchStateErrorInequalityDifferentErrors() {
        // Given
        let error1 = FetchError.serialization
        let error2 = FetchError.unknown
        let state1 = FetchState.error(error1)
        let state2 = FetchState.error(error2)
        
        // Then
        XCTAssertNotEqual(state1, state2)
    }

    func testFetchStateErrorInequalitySameErrorDifferentDescription() {
        // Given
        let error1 = FetchError.serviceError(NSError(domain: "Test", code: 1, userInfo: [NSLocalizedDescriptionKey: "Error 1"]))
        let error2 = FetchError.serviceError(NSError(domain: "Test", code: 1, userInfo: [NSLocalizedDescriptionKey: "Error 2"]))
        let state1 = FetchState.error(error1)
        let state2 = FetchState.error(error2)
        
        // Then
        XCTAssertNotEqual(state1, state2)
    }

    func testFetchStateMixedEquality() {
        // Given
        let state1 = FetchState.loading
        let state2 = FetchState.finished
        let error1 = FetchError.serialization
        let state3 = FetchState.error(error1)
        
        // Then
        XCTAssertNotEqual(state1, state2)
        XCTAssertNotEqual(state1, state3)
        XCTAssertNotEqual(state2, state3)
    }
}

