//
//  DoorLockedState.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

struct DoorLockedState: DoorStateInterface {    
    var text: String?
    
    //ui
    // specificUI
    
    var state: DoorStates {
        .locked
    }
    
    func next() -> any SettingItemStateInterface {
        return DoorUnlockingState()
    }
}
