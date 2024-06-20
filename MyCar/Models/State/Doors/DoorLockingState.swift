//
//  DoorLockingState.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import Foundation

struct DoorLockingState: DoorStateInterface {
    var text: String {
        "..."
    }
    
    var state: DoorStates {
        .locking
    }

    func next() -> any SettingItemStateInterface {
        return DoorLockedState()
    }
}
