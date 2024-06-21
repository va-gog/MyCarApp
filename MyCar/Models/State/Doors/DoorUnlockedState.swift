//
//  DoorUnlockedState.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct DoorUnlockedState: DoorStateInterface {
    var text: String? {
        "Unlocked"
    }
    
    var state: DoorStates {
        .unlocked
    }
    
    var uiChangableState: DoorChangableInterface {
        DoorUIChangableAttributes(leftButtonDisabled: false,
                                  leftButtonBackground: Color(hex: ProjectColorSpecs.lightBrown),
                                  leftButtonIconColor: .white,
                                  rightButtonDisabled: true,
                                  rightButtonBackground: .black,
                                  rightButtonIconColor: .white)
    }
    
    var uiFixedState: DoorUIFixedAttributes {
        DoorUIFixedAttributes()
    }
    
    func next() -> any SettingItemStateInterface {
        return DoorLockingState()
    }
}
