//
//  TimerManager.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import SwiftUI
import Combine

protocol TimerManagerInterface {
    var timerCompleted: PassthroughSubject<Bool, Never> { get }
    func startTimer(prefix: Int)
}

final class TimerManager: TimerManagerInterface {
    var timerCompleted = PassthroughSubject<Bool, Never>()

    private var cancellables = Set<AnyCancellable>()
    
    func startTimer(prefix: Int) {
        var start = 0
        Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .prefix(prefix)
            .sink { _ in
            } receiveValue: { [weak self] value in
                start += 1
                if start == prefix {
                    self?.timerCompleted.send(true)
                }
            }
            .store(in: &cancellables)
    }
}
    
