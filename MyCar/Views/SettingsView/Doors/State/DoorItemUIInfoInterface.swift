//
//  DoorItemUIInfoInterface.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import Foundation

protocol DoorItemUIInfoInterface: SettingItemUIInfoInterface {
    var state: DoorState { get }
    var uiChangableState: DoorUIChangableTheme { get }
}
