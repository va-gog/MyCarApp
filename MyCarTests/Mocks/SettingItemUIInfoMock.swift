//
//  SettingItemUIInfoMock.swift
//  MyCarTests
//
//  Created by Gohar Vardanyan on 6/22/24.
//

@testable import MyCar

struct SettingItemUIInfoMock: SettingItemUIInfoInterface {
    var title: String = ""
    
    var state: SettingItemStateInterface = DoorLockedState()
    
    func changeState() { }
    
    
}
