//
//  DoorUnlockedState.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

struct DoorUnlockedState: DoorStateInterface {
    var text: String {
        "Unlocked"
    }
    
    var state: DoorStates {
        .unlocked
    }

    func next() -> any SettingItemStateInterface {
        return DoorLockingState()
    }
}
