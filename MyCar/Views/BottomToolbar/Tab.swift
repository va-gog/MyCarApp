//
//  Tab.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

enum Tab: Int, CaseIterable {
    case home, vehicle, location, settings

    var title: String {
        switch self {
        case .home: return "Home"
        case .vehicle: return "Vehicle"
        case .location: return "Location"
        case .settings: return "Settings"
        }
    }

    var icon: String {
        switch self {
        case .home: return "house.fill"
        case .vehicle: return "car.fill"
        case .location: return "location.fill"
        case .settings: return "gearshape.fill"
        }
    }
}
