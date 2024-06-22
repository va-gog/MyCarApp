//
//  DoorStateTests.swift
//  MyCarTests
//
//  Created by Gohar Vardanyan on 6/22/24.
//

import XCTest
@testable import MyCar
import SwiftUI

final class DoorStateTests: XCTestCase {

    func testDoorLockedStateNextReturnsUnlockingState() {
        // Given
        let state = DoorLockedState()
        
        // When
        let nextState = state.next()
        
        // Then
        XCTAssertTrue(nextState is DoorUnlockingState)
    }
    
    func testDoorUnlockingStateNextReturnsUnlockedState() {
        // Given
        let state = DoorUnlockingState()
        
        // When
        let nextState = state.next()
        
        // Then
        XCTAssertTrue(nextState is DoorUnlockedState)
    }
    
    func testDoorUnlockedStateNextReturnsLockedState() {
        // Given
        let state = DoorUnlockedState()
        
        // When
        let nextState = state.next()
        
        // Then
        XCTAssertTrue(nextState is DoorLockedState)
    }
    
    func testDoorUnlockingStateUIChangableStateIsCorrect() {
        // Given
        let state = DoorUnlockingState()
        
        // When
        let uiState = state.uiChangableState
        
        // Then
        XCTAssertTrue(uiState.leftButtonDisabled)
        XCTAssertEqual(uiState.leftButtonBackground, .white)
        XCTAssertEqual(uiState.leftButtonIconColor, .white)
        XCTAssertTrue(uiState.rightButtonDisabled)
        XCTAssertEqual(uiState.rightButtonBackground, Color(hex: ProjectColorSpecs.lightBrown))
        XCTAssertEqual(uiState.rightButtonIconColor, Color(hex: ProjectColorSpecs.lightBrown))
    }
}

