//
//  DoorLockedState.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct DoorLockedState: DoorStateInterface {
    var descriptionText: String? 
    var state: DoorStates { .locked }
    var uiFixedState: DoorUIFixedAttributes { DoorUIFixedAttributes() }
    
    var uiChangableState: DoorChangableInterface {
        DoorUIChangableAttributes(leftButtonDisabled: true,
                                  leftButtonBackground: .black,
                                  leftButtonIconColor: .white,
                                  rightButtonDisabled: false,
                                  rightButtonBackground: .black,
                                  rightButtonIconColor: .white)
    }
    
    func next() -> any SettingItemStateInterface {
        return DoorUnlockingState()
    }
}
