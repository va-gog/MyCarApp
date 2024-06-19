//
//  CarInfoService.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

protocol CarInfoServiceProtocol {
    func swipeAction()
}

final class CarInfoService: CarInfoServiceProtocol {
    @Published var selectedIndex: Int = 0
    @Published var lastUpdatedTime: TimeInterval = .zero
    @GestureState private var translation: CGFloat = 0
    
    func swipeAction() {
        self.selectedIndex = 0
        // implement Swipe for
    }
    
}

