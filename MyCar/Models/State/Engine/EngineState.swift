//
//  EngineVieModel.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

protocol EngineState {
    var started: Bool { get }
   func next() -> EngineState
}

