//
//  SettingItemUIInfo.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import Foundation

class SettingItemUIInfo: SettingItemUIInfoInterface {
    var title: String
    var state: SettingItemStateInterface
    
    init(title: String, state: SettingItemStateInterface) {
        self.title = title
        self.state = state
    }
    
    func changeState() {
        state = state.next()
    }

}
