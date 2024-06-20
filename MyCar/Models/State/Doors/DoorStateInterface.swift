//
//  DoorStateInterface.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import Foundation

protocol DoorStateInterface: SettingItemStateInterface {
    var state: DoorStates { get }
}
