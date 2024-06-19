//
//  EngineStartedState.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

struct EngineStartedState: EngineState {
    var started: Bool {
        true
    }
    
    func next() -> EngineState {
        return EngineStoppedState()
    }
}
