//
//  EngineModel.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

struct EngineModel: Decodable, SettingModelProtocol {
    let title: String
    let started: Bool
}
