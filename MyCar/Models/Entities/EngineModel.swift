//
//  EngineModel.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

struct EngineModel: Codable {
    let name: String
    let started: Bool
    
    func state() -> EngineState {
        started ? EngineStartedState() : EngineStoppedState()
    }

}
