//
//  EngineStateInerface.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import Foundation

protocol EngineStateInterface: SettingItemStateInterface {
    var state: EngineState { get }
}