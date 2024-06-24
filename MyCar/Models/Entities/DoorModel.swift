//
//  DoorModel.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

struct DoorModel: Decodable, SettingModelProtocol {
    var title: String
    var locked: Bool
}
