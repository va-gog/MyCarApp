//
//  DoorProgressState.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import SwiftUI

struct DoorUnlockingState: DoorStateInterface  {
    var text: String? {
        "..."
    }
    
    var state: DoorStates {
        .unlocking
    }
    
    var uiChangableState: DoorChangableInterface {
        DoorUIChangableAttributes(leftButtonBackground: .white,
                         leftButtonIconColor: .white,
                         rightButtonBackground: .gray,
                         rightButtonIconColor: .yellow)
    }
    
    var uiFixedState: DoorUIFixedAttributes {
        DoorUIFixedAttributes()
    }

    func next() -> any SettingItemStateInterface {
        return DoorUnlockedState()
    }
}
