//
//  SettingItemStateInterface.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import Foundation

protocol SettingItemStateInterface {
    var descriptionText: String? { get }
    
    func next() -> SettingItemStateInterface
}
