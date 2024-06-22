//
//  Icon.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

enum Icon: String {
    case locked
    case unlocked
    case refresh
    case gas
    
    var iconName: String {
        switch self {
        case .locked:
            return IconNames.locked
        case .unlocked:
            return IconNames.unlocked
        case .refresh:
            return IconNames.refresh
        case .gas:
            return IconNames.gas
        }
    }
}
