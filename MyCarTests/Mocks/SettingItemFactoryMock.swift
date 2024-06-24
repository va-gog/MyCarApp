//
//  SettingItemFactoryMock.swift
//  MyCarTests
//
//  Created by Gohar Vardanyan on 6/22/24.
//

@testable import MyCar

struct SettingItemFactoryMock: SettingItemFactoryInterface {
    func settingForModel(_ model: SettingModelProtocol) -> (any SettingItemUIInfoInterface)? {
        SettingItemUIInfoFake()
    }
    
    
}
