//
//  EngineStartedState.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct EngineStartedState: EngineStateInterface {
    var text: String?
    
    var uiChangableState: EngineChangableInterface {
        EngineUIChangableAttributes(leftButtonBackground: .black,
                                    leftButtonTextColor: .white,
                                    rightButtonBackground: .black,
                                    rightButtonTextColor: .white)
    }
    
    var uiFixedState: EngineUIFixedAttributes {
        EngineUIFixedAttributes()
    }
    
    var state: EngineState {
        .started
    }
    
    func next() -> any SettingItemStateInterface {
        return EngineStoppedState()
    }
}
