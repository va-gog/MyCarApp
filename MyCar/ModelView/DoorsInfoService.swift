//
//  DoorsInfoService.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation
import Combine

protocol DoorsInfoServiceProtocol {
    var state: DoorState { get }
    var loadingFinished: Bool { get }
    
    func changeState()
    func startTimer()
}

final class DoorsInfoService: DoorsInfoServiceProtocol {
    @Published var state: DoorState
    @Published var loadingFinished: Bool = false
    
    private var loadingDuration: TimeInterval
    
    init(state: DoorState, loadingFinished: Bool, loadingDuration: TimeInterval) {
        self.state = state
        self.loadingFinished = loadingFinished
        self.loadingDuration = loadingDuration
    }
    
    func changeState() {
        state = state.next()
    }
    
    func startTimer() {
        _ = Timer.publish(every: loadingDuration, on: .main, in: .common)
            .autoconnect()
            .first()
            .sink { [weak self] _ in
                self?.finishTimer()
            }
    }
    
    private func finishTimer() {
        self.loadingFinished = true
    }
}

