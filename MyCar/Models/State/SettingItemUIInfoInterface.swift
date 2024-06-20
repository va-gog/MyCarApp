//
//  SettingItemUIInfoInterface.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import Foundation

protocol SettingItemUIInfoInterface {
    var title: String { get }
    var state: SettingItemStateInterface { get set }
    
    func changeState()
}

