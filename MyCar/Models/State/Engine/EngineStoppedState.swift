//
//  EngineStoppedState.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

struct EngineStoppedState: EngineState {
    var started: Bool {
        false
    }
    
    func next() -> EngineState {
        return EngineStartedState()
    }
}
