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
                                  rightButtonBackground:  Color(hex: ProjectColorSpecs.lightBrown),
                                  rightButtonIconColor: Color(hex: ProjectColorSpecs.lightBrown))
    }
    
    
    func next() -> any SettingItemStateInterface {
        return DoorUnlockedState()
    }
}
