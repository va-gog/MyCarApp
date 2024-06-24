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
            return  DoorItemUIInfo(state: setting.locked ? .locked : .unlocked)
            
        case let setting as EngineModel:
            return EngineItemUIInfo(state: setting.started ? .started : .stopped)
        default:
            return nil
        }
    }
}
