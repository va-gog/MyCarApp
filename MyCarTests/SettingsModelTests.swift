//
//  SettingsModelTests.swift
//  MyCarTests
//
//  Created by Gohar Vardanyan on 6/22/24.
//

import XCTest
@testable import MyCar

final class SettingsModelTests: XCTestCase {
    func testSettingModelReturnAllSettings() {
        // Given
        let doorModel = DoorModel(title: "Test Door", locked: true)
        let engineModel = EngineModel(title: "Test Engine", started: true)
        let settingsModel = SettingsModel(doors: doorModel, engine: engineModel)
        
        // When and Then
        XCTAssertEqual(settingsModel.allSettings().count, 2)
    }
}
