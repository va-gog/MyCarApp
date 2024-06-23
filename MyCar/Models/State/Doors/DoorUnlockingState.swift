//
//  DoorProgressState.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import Foundation

struct DoorUnlockingState: DoorStateInterface  {
    var text: String {
        "..."
    }
    
    //user info
    
    var state: DoorStates {
        .unlocking
    }

    func next() -> any SettingItemStateInterface {
        return DoorUnlockingState()
    }
}
