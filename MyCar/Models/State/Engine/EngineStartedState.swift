//
//  EngineStartedState.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

class EngineStartedState: EngineStateInterface {
    var text: String = ""
    // UI

    var state: EngineState {
        .started
    }
    
    func next() -> any SettingItemStateInterface {
        return EngineStoppedState()
    }
}
