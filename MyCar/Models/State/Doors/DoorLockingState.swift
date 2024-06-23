//
//  DoorLockingState.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import SwiftUI

struct DoorUnlockingState: DoorStateInterface {
    var descriptionText: String? { "..." }
    var state: DoorStates { .unlocking}
    var uiFixedState: DoorUIFixedAttributes { DoorUIFixedAttributes() }
    
    var uiChangableState: DoorChangableInterface {
        DoorUIChangableAttributes(leftButtonDisabled: true,
                                  leftButtonBackground: .white,
                                  leftButtonIconColor: .white,
                                  rightButtonDisabled: true,
                                  rightButtonBackground:  HexColorSpec.lightBrown,
                                  rightButtonIconColor: HexColorSpec.lightBrown)
    }
    
    
    func next() -> any SettingItemStateInterface {
        return DoorUnlockedState()
    }
}
