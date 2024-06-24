//
//  SettingItemUIInfoInterface.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import Foundation

protocol EngineItemUIInfoInterface: SettingItemUIInfoInterface {
    var state: EngineState { get }
    var uiChangableState: EngineUIChangableTheme { get }
}
