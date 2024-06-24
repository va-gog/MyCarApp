//
//  SettingItemUIInfoInterface.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import Foundation
import SwiftUI

struct DoorItemUIInfo: DoorItemUIInfoInterface {    
    var title: String = "Doors"
    var description: String? {
        switch state {
        case .locked:
            "Locked"
        case .unlocked:
            nil
        case .locking:
            "..."
        }
    }
    var state: DoorState
    
    var uiChangableState: DoorUIChangableTheme {
        switch state {
        case .unlocked:
            DoorUIChangableTheme(leftButtonDisabled: true,
                                 leftButtonBackground: .black,
                                 leftButtonIconColor: .white,
                                 rightButtonDisabled: false,
                                 rightButtonBackground: .black,
                                 rightButtonIconColor: .white)
        case .locked:
            DoorUIChangableTheme(leftButtonDisabled: false,
                                      leftButtonBackground: HexColorSpec.lightBrown,
                                      leftButtonIconColor: .white,
                                      rightButtonDisabled: true,
                                      rightButtonBackground: .black,
                                      rightButtonIconColor: .white)
        case .locking:
            DoorUIChangableTheme(leftButtonDisabled: true,
                                      leftButtonBackground: .white,
                                      leftButtonIconColor: .white,
                                      rightButtonDisabled: true,
                                      rightButtonBackground:  HexColorSpec.lightBrown,
                                      rightButtonIconColor: HexColorSpec.lightBrown)
        }
    }
       
}
