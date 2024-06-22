//
//  EngineStoppedState.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct EngineStoppedState: EngineStateInterface {
    var descriptionText: String?
    var state: EngineState { .stopped }
    var uiFixedState: EngineUIFixedAttributes { EngineUIFixedAttributes() }

    var uiChangableState: EngineChangableInterface {
        EngineUIChangableAttributes(leftButtonBackground: .black,
                           leftButtonTextColor: .black,
                           rightButtonBackground: .white,
                           rightButtonTextColor: .white)
    }
    
    func next() -> any SettingItemStateInterface {
        return EngineStartedState()
    }
}
