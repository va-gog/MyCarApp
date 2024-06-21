//
//  SettingItemStateInterface.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import Foundation

protocol SettingItemStateInterface {
    var text: String? { get }
    func next() -> SettingItemStateInterface
}
