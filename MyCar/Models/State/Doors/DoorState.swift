//
//  DoorState.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

protocol DoorState {
   var locked: Bool { get }
   func next() -> DoorState
}

