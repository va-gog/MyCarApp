//
//  DoorLockedState.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

struct DoorLockedState: DoorState {
    var locked: Bool {
        true
    }
    
    func next() -> DoorState {
        return DoorUnlockedState()
    }
}
