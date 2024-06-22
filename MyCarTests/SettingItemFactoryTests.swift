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
        let title = "Door"
        
        // When
        let settingLocked = sut.settingForModel(DoorModel(title: title, locked: true))
        
        // Then
        XCTAssertEqual(settingLocked!.title, title)
        XCTAssertNotNil(settingLocked?.state as? DoorStateInterface)
        XCTAssertNotNil((settingLocked?.state as? DoorStateInterface) as? DoorLockedState)
        
       
    }
    
    func testSettingForModelWithDoorUnlockedReturnsDoorUnlockedState() {
        // Given
        let title = "Door"
        
        // When
        let settingUnlocked = sut.settingForModel(DoorModel(title: title, locked: false))
        
        // Then
        XCTAssertNotNil((settingUnlocked?.state as? DoorStateInterface) as? DoorUnlockedState)
    }
    
    func testSettingForModelWithEngineStartedReturnsEngineStartedState() {
        // Given
        let title = "Engine"
        
        // When
        let settingStarted = sut.settingForModel(EngineModel(title: title, started: true))
        
        // Then
        XCTAssertEqual(settingStarted!.title, title)
        XCTAssertNotNil(settingStarted?.state as? EngineStateInterface)
        XCTAssertNotNil((settingStarted?.state as? EngineStateInterface) as? EngineStartedState)
    }
        
    func testSettingForModelWithEngineStoppedReturnsEngineStoppedState() {
        // Given
        let title = "Engine"
        
        // When
        let settingStopped = sut.settingForModel(EngineModel(title: title, started: false))
        
        // Then
        XCTAssertEqual(settingStopped!.title, title)
        XCTAssertNotNil(settingStopped?.state as? EngineStateInterface)
        XCTAssertNotNil((settingStopped?.state as? EngineStateInterface) as? EngineStoppedState)
    }
    
    func testSettingForModelWithEngineAbsentReturnsNil() {
        // When
        let settingStarted = sut.settingForModel(SettingModelFake())
        
        // Then
        XCTAssertNil(settingStarted)
    }

}
