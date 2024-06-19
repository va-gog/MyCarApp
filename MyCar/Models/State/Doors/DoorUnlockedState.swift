//
//  DoorUnlockedState.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

struct DoorUnlockedState: DoorState {
    var locked: Bool {
        false
    }
    
    func next() -> DoorState {
        return DoorLockedState()
    }
}
