//
//  EngineItemUIInfoInterface.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import Foundation

struct EngineItemUIInfo: EngineItemUIInfoInterface {
    var title: String = "Engine"
    var description: String?
    var state: EngineState
    
    var uiChangableState: EngineUIChangableTheme {
        switch state {
        case .started:
            EngineUIChangableTheme(leftButtonBackground: .black,
                                   leftButtonTextColor: .white,
                                   rightButtonBackground: .black,
                                   rightButtonTextColor: .white)
        case .stopped:
            EngineUIChangableTheme(leftButtonBackground: .black,
                                   leftButtonTextColor: .white,
                                   rightButtonBackground: .black,
                                   rightButtonTextColor: .white)
            
        }
    }
}
