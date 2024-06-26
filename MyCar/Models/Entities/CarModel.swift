//
//  CarModel.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

struct CarModel: Decodable {
    let name: String
    let fuel: String
    let images: [String]
    let settings: SettingsModel
}
