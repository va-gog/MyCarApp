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
        return  switch self {
        case .locked:
            "act_lock"
        case .unlocked:
            "act_unlock"
        case .refresh:
            "btn_refresh"
        case .gas:
            "notif_gas"
        }
    }
}
