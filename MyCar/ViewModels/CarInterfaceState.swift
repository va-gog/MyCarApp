//
//  CarInterfaceState.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import Foundation

final class CarInterfaceState {
    var carDescription: CarDescriptionModel
    var settingsStates: [SettingItemUIInfoInterface]
    
    init(carDescription: CarDescriptionModel = CarDescriptionModel(), settingsStates: [SettingItemUIInfoInterface] = []) {
        self.carDescription = carDescription
        self.settingsStates = settingsStates
    }
}
