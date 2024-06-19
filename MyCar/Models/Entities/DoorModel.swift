//
//  DoorModel.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

struct DoorModel: Codable {
    var name: String
    var locked: Bool
    
    func state() -> DoorState {
        locked ? DoorLockedState() : DoorUnlockedState()
    }
}
