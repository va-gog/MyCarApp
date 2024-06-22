//
//  TimeManagerTests.swift
//  MyCarTests
//
//  Created by Gohar Vardanyan on 6/22/24.
//

import XCTest
@testable import MyCar
import Combine

final class TimerManagerTests: XCTestCase {
    private var timerManager: TimerManager!
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        timerManager = TimerManager()
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        timerManager = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testTimerCompletesAfterSpecificTime() {
        // Given
        let prefix = 1
        let expectation = XCTestExpectation(description: "Timer should complete after \(prefix) seconds")
        
        timerManager.timerCompleted
            .sink { completed in
                XCTAssertTrue(completed)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // When
        timerManager.startTimer(prefix: prefix)
        
        // Then
        wait(for: [expectation], timeout: TimeInterval(prefix + 1))
    }
    
    func testTimerCancelled() {
        // Given
        let prefix = 1
        let expectation = XCTestExpectation(description: "Timer should not complete after cancellation")
        expectation.isInverted = true // This expectation should not be fulfilled
        
        timerManager.timerCompleted
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // When
        timerManager.startTimer(prefix: prefix)
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.cancellables.removeAll()
        }
        
        // Then
        wait(for: [expectation], timeout: TimeInterval(prefix + 1))
    }
}
