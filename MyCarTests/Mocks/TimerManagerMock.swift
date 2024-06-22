//
//  TimerManagerMock.swift
//  MyCarTests
//
//  Created by Gohar Vardanyan on 6/22/24.
//

@testable import MyCar
import Combine

final class TimerManagerMock: TimerManagerInterface {
    var startTimerCalled = false
    let timerCompleted = PassthroughSubject<Bool, Never>()
    
    func startTimer(prefix: Int) {
        startTimerCalled = true
    }
}
