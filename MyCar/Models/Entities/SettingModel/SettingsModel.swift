//
//  SettingsModel.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import Foundation

struct SettingsModel: Decodable {
    let doors: DoorModel
    let engine: EngineModel
    
    func allSettings() -> [any SettingModelProtocol] {
        [doors, engine]
    }
}
