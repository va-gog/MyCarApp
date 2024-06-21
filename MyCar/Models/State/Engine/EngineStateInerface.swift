//
//  EngineStateInerface.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import SwiftUI

protocol EngineStateInterface: SettingItemStateInterface {
    var state: EngineState { get }
    var uiChangableState: EngineChangableInterface { get }
    var uiFixedState: EngineUIFixedAttributes { get }
}
