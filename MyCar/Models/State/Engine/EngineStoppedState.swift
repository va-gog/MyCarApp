//
//  EngineStoppedState.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

final class EngineStoppedState: EngineStateInterface {
    var text: String = ""
    // UI
    var state: EngineState {
        .stopped
    }
    
    func next() -> any SettingItemStateInterface {
        return EngineStartedState()
    }
}
