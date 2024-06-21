//
//  DoorLockedState.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct DoorLockedState: DoorStateInterface {    
    var text: String?
    
    var state: DoorStates {
        .locked
    }
    
    var uiChangableState: DoorChangableInterface {
        DoorUIChangableAttributes(leftButtonBackground: .black,
                         leftButtonIconColor: .white,
                         rightButtonBackground: .black,
                         rightButtonIconColor: .white)
    }
    
    var uiFixedState: DoorUIFixedAttributes {
        DoorUIFixedAttributes()
    }
    
    func next() -> any SettingItemStateInterface {
        return DoorUnlockingState()
    }
}
