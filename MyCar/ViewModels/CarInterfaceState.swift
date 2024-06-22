//
//  CarInterfaceState.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import Foundation

protocol CarInterfaceStateInterface {
    var carDescription: CarDescriptionModel { get }
    var settingsStates: [SettingItemUIInfoInterface] { get set }
}

final class CarInterfaceState: CarInterfaceStateInterface {
    var carDescription: CarDescriptionModel
    var settingsStates: [SettingItemUIInfoInterface] 
    
    init(carDescription: CarDescriptionModel = CarDescriptionModel(), 
         settingsStates: [SettingItemUIInfoInterface] = []) {
        self.carDescription = carDescription
        self.settingsStates = settingsStates
    }
}
