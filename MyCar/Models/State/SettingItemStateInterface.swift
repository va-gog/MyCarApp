//
//  SettingItemStateInterface.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import Foundation

protocol SettingItemStateInterface {
    var text: String? { get }
    //user interface setups
    //state
    func next() -> SettingItemStateInterface
}
