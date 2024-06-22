//
//  DoorUnlockedState.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct DoorUnlockedState: DoorStateInterface {
    var descriptionText: String? { "Unlocked" }
    var state: DoorStates { .unlocked }
    var uiFixedState: DoorUIFixedAttributes { DoorUIFixedAttributes() }
    
    var uiChangableState: DoorChangableInterface {
        DoorUIChangableAttributes(leftButtonDisabled: false,
                                  leftButtonBackground: Color(hex: ProjectColorSpecs.lightBrown),
                                  leftButtonIconColor: .white,
                                  rightButtonDisabled: true,
                                  rightButtonBackground: .black,
                                  rightButtonIconColor: .white)
    }
    
    func next() -> any SettingItemStateInterface {
        return DoorLockedState()
    }
}
