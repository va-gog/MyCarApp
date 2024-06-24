//
//  SettingItemFactoryTests.swift
//  MyCarTests
//
//  Created by Gohar Vardanyan on 6/22/24.
//

import XCTest
@testable import MyCar

final class SettingItemFactoryTests: XCTestCase {
    private var sut: SettingItemFactory!

    override func setUp() {
        super.setUp()
        sut = SettingItemFactory()
    }

    override func tearDown()  {
        super.tearDown()
        sut = nil
    }

    func testSettingForModelWithDoorLockedReturnsDoorLockedState() {
        // Given
        let title = "Doors"
        
        // When
        let settingLocked = sut.settingForModel(DoorModel(title: title, locked: true))
        
        // Then
        XCTAssertEqual(settingLocked!.title, title)
        XCTAssertNotNil(settingLocked is DoorItemUIInfo)
        XCTAssertEqual((settingLocked as? DoorItemUIInfo)?.state, .locked)
        
       
    }
    
    func testSettingForModelWithDoorUnlockedReturnsDoorUnlockedState() {
        // Given
        let title = "Doors"
        
        // When
        let settingUnlocked = sut.settingForModel(DoorModel(title: title, locked: false))
        
        // Then
        XCTAssertEqual(settingUnlocked!.title, title)
        XCTAssertNotNil(settingUnlocked is DoorItemUIInfo)
        XCTAssertEqual((settingUnlocked as? DoorItemUIInfo)?.state, .unlocked)
    }
    
    func testSettingForModelWithEngineStartedReturnsEngineStartedState() {
        // Given
        let title = "Engine"
        
        // When
        let settingStarted = sut.settingForModel(EngineModel(title: title, started: true))
        
        // Then
        XCTAssertEqual(settingStarted!.title, title)
        XCTAssertNotNil(settingStarted is EngineItemUIInfo)
        XCTAssertEqual((settingStarted as? EngineItemUIInfo)?.state, .started)
    }
        
    func testSettingForModelWithEngineStoppedReturnsEngineStoppedState() {
        // Given
        let title = "Engine"
        
        // When
        let settingStopped = sut.settingForModel(EngineModel(title: title, started: false))
        
        // Then
        XCTAssertEqual(settingStopped!.title, title)
        XCTAssertNotNil(settingStopped is EngineItemUIInfo)
        XCTAssertEqual((settingStopped as? EngineItemUIInfo)?.state, .stopped)
    }
    
    func testSettingForModelWithEngineAbsentReturnsNil() {
        // When
        let settingStarted = sut.settingForModel(SettingModelFake())
        
        // Then
        XCTAssertNil(settingStarted)
    }

}
