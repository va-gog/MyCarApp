//
//  EngineStoppedState.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct EngineStoppedState: EngineStateInterface {
    var text: String?

    var uiChangableState: EngineChangableInterface {
        EngineUIChangableAttributes(leftButtonBackground: .black,
                           leftButtonTextColor: .black,
                           rightButtonBackground: .white,
                           rightButtonTextColor: .white)
    }
    
    var uiFixedState: EngineUIFixedAttributes {
        EngineUIFixedAttributes()
    }
    
    var state: EngineState {
        .stopped
    }
    
    func next() -> any SettingItemStateInterface {
        return EngineStartedState()
    }
}
