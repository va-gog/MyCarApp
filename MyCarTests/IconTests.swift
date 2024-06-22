//
//  IconTests.swift
//  MyCarTests
//
//  Created by Gohar Vardanyan on 6/22/24.
//

import XCTest
@testable import MyCar

final class IconTests: XCTestCase {

    func testIconNameForLocked() {
        // Given
        let icon = Icon.locked
        
        // When
        let iconName = icon.iconName
        
        // Then
        XCTAssertEqual(iconName, IconNames.locked)
    }
    
    func testIconNameForUnlocked() {
        // Given
        let icon = Icon.unlocked
        
        // When
        let iconName = icon.iconName
        
        // Then
        XCTAssertEqual(iconName, IconNames.unlocked)
    }
    
    func testIconNameForRefresh() {
        // Given
        let icon = Icon.refresh
        
        // When
        let iconName = icon.iconName
        
        // Then
        XCTAssertEqual(iconName, IconNames.refresh)
    }
    
    func testIconNameForGas() {
        // Given
        let icon = Icon.gas
        
        // When
        let iconName = icon.iconName
        
        // Then
        XCTAssertEqual(iconName, IconNames.gas)
    }
}
