//
//  EngineInfoService.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

protocol EngineInfoServiceProtocol {
    var state: EngineState { get }
    
    func changeState()
}

// TODO: Here I Show toast that Buttons are in development process
final class EngineInfoService: EngineInfoServiceProtocol {
    @Published var state: EngineState
    
    init(state: EngineState) {
        self.state = state
    }
    
    func changeState() {
        state = state.next()
    }
}
