//
//  EngineStartedState.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct EngineStartedState: EngineStateInterface {
    var descriptionText: String?
    var state: EngineState { .started }
    var uiFixedState: EngineUIFixedAttributes { EngineUIFixedAttributes() }
    
    var uiChangableState: EngineChangableInterface {
        EngineUIChangableAttributes(leftButtonBackground: .black,
                                    leftButtonTextColor: .white,
                                    rightButtonBackground: .black,
                                    rightButtonTextColor: .white)
    }
    
    func next() -> any SettingItemStateInterface {
        return EngineStoppedState()
    }
}
