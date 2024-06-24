//
//  MyCarTests.swift
//  MyCarTests
//
//  Created by Gohar Vardanyan on 6/19/24.
//

//
//  MyCarTests.swift
//  MyCarTests
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import XCTest
import Combine
@testable import MyCar

final class CarScreenViewModelTests: XCTestCase {
    private var sut: CarScreenViewModel!
    private var fetchService: CarDataFetchServiceMock!
    private var timerManager: TimerManagerMock!
    private var cancellables: Set<AnyCancellable>!
    private var carData: CarModel!

    override func setUp() {
        super.setUp()
        fetchService = CarDataFetchServiceMock()
        timerManager = TimerManagerMock()
        cancellables = Set<AnyCancellable>()
        sut = CarScreenViewModel(fetchService: fetchService,
                                 timerManager: timerManager,
                                 settingsStates: [DoorItemUIInfo(title: "Doors",
                                                                         state: .locked)],
                                 settinItemFactory: SettingItemFactoryMock())
        carData = carModel()
    }

    override func tearDown() {
        sut = nil
        fetchService = nil
        timerManager = nil
        cancellables = nil
        carData = nil
        super.tearDown()
    }

    func testFetchInfoWithURLWhenURLIsNilThrowsError() throws {
        // Given
        let expectation = XCTestExpectation(description: "Handle nil URL")
        
        // When & Then
        XCTAssertThrowsError(try sut.fetchInfoWithURL(nil)) { error in
            DispatchQueue.main.async {
                XCTAssertEqual(error as? FetchError, FetchError.unknown)
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchInfoWithURLWhenFailedUpdatesFetchStateToError() throws {
        // Given
        let sut = CarScreenViewModel(fetchService: CarDataFetchServiceMock(succeed: false), timerManager: timerManager)
        let url = URL(string: "https://example.com/car")!
        let expectation = XCTestExpectation(description: "Handle fetch failure")
        
        sut.$fetchState
            .dropFirst(2)
            .sink { state in
                if case .error = state {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        // When
        try sut.fetchInfoWithURL(url)
        
        // Then
        wait(for: [expectation], timeout: 1.0)
        if case .error = sut.fetchState {
            XCTAssert(true)
        } else {
            XCTFail("Expected state to be .error")
        }
    }

    func testFetchInfoWithURLWhenSucceedUpdatesFetchStateToFinished() throws {
        // Given
        let sut = CarScreenViewModel(fetchService: CarDataFetchServiceMock(), timerManager: timerManager)
        let url = URL(string: "https://example.com/car")!
        let expectation = XCTestExpectation(description: "Handle fetch success")
        
        sut.$fetchState
            .dropFirst(2)
            .sink { state in
                if state == .finished {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        // When
        try sut.fetchInfoWithURL(url)
        
        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(sut.fetchState, .finished)
    }
    
    func testSetupWithDataUpdatesInterfaceState() {
        // Given
        // When
        sut.setupWithData(carData)
        
        // Then
        XCTAssertEqual(sut.carDescription.name, carData.name)
        XCTAssertEqual(sut.carDescription.fuel, carData.fuel)
        XCTAssertEqual(sut.carDescription.imagesNames, carData.images)
        XCTAssertEqual(sut.settingsStates.count, 2)
        XCTAssertEqual(sut.fetchState, .finished)
    }

    func testAlertApplyButtonClickedUpdatesAlertViewInfo() {
        // Given
        var alertViewInfo: AlertViewInfo?
        let expectation = XCTestExpectation(description: "Alert view info updated")
        
        sut.$alertViewInfo
            .sink { info in
                alertViewInfo = info
                expectation.fulfill()
            }
            .store(in: &cancellables)

        // When
        sut.buttonAction(buttonType: .unlock)
        
        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(alertViewInfo)
    }
    
    
    func testLockButtonClickedUpdatesInterfaceState() {
        // Given
        var stateChanged = false
        let expectation = XCTestExpectation(description: "State change when lock pressed")
        
        sut.settingsStates.publisher
            .sink { _ in
                stateChanged = true
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // When
        sut.buttonAction(buttonType: .lock)
        
        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(stateChanged)
    }
    
    func testApplyButtonClickedUpdatesInterfaceStateAndTimer() {
        // Given
        var stateChanged = false
        let expectation = XCTestExpectation(description: "Unlock action")
        
        sut.settingsStates.publisher
            .sink { _ in
                stateChanged = true
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // When
        sut.buttonAction(buttonType: .apply)
        
        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(stateChanged)
    }
    
    func testStopButtonClickedUpdatesInterfaceState() {
        // Given
        var stateChanged = false
        let expectation = XCTestExpectation(description: "Stop action")
        
        sut.settingsStates.publisher
            .sink { _ in
                stateChanged = true
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // When
        sut.buttonAction(buttonType: .stop)
        
        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(stateChanged)
    }
    
    func testStartButtonClickedUpdatesInterfaceState() {
        // Given
        var stateChanged = false
        let expectation = XCTestExpectation(description: "Start action")
        
        sut.settingsStates.publisher
            .sink { _ in
                stateChanged = true
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // When
        sut.buttonAction(buttonType: .start)
        
        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(stateChanged)
    }
    
    func testTimerCompletedUpdatesInterfaceState() {
        // Given
        var updatedTime = false
        let expectation = XCTestExpectation(description: "Timer action completed")
        
        sut.settingsStates.publisher
            .sink { _ in
                updatedTime = true
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // When
        timerManager.timerCompleted.send(true)
        
        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(updatedTime)
    }
    
    private func carModel(locked: Bool = true, started: Bool = true) -> CarModel {
        return CarModel(name: "Car", fuel: "fuel", images: ["image1", "image2"],
                        settings: SettingsModel(doors: DoorModel(title: "Doors", locked: locked),
                                                engine: EngineModel(title: "Engine", started: started)))
    }

}

