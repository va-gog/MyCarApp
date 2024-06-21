//
//  DoorLockingState.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import SwiftUI

struct DoorLockingState: DoorStateInterface {
    var text: String? {
        "..."
    }
    
    var state: DoorStates {
        .locking
    }
    
    var uiChangableState: DoorChangableInterface {
        DoorUIChangableAttributes(leftButtonBackground: .white,
                         leftButtonIconColor: .white,
                         rightButtonBackground:  Color(hex: ProjectColorSpecs.lightBrown),
                         rightButtonIconColor: Color(hex: ProjectColorSpecs.lightBrown))
    }
    
    var uiFixedState: DoorUIFixedAttributes {
        DoorUIFixedAttributes()
    }
    
    func next() -> any SettingItemStateInterface {
        return DoorLockedState()
    }
}
