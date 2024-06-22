//
//  SettingItemFactory.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/22/24.
//

import Foundation

struct SettingItemFactory: SettingItemFactoryInterface {
    func settingForModel(_ model: SettingModelProtocol) -> SettingItemUIInfoInterface? {
        switch model {
        case let setting as DoorModel:
            return SettingItemUIInfo(title: setting.title,
                                 state: setting.locked ? DoorLockedState() : DoorUnlockedState())
            
        case let setting as EngineModel:
            return SettingItemUIInfo(title: setting.title,
                                 state: setting.started ? EngineStartedState() : EngineStoppedState())
            
        default:
            return nil
        }
    }
}
