//
//  SettingItemFactoryInterface.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/22/24.
//

import Foundation

protocol SettingItemFactoryInterface {
    func settingForModel(_ model: SettingModelProtocol) -> SettingItemUIInfoInterface?
}

