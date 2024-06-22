//
//  CarInterfaceStateFake.swift
//  MyCarTests
//
//  Created by Gohar Vardanyan on 6/22/24.
//

@testable import MyCar

struct CarInterfaceStateFake: CarInterfaceStateInterface {
    var carDescription: CarDescriptionModel = CarDescriptionModel()
    var settingsStates: [SettingItemUIInfoInterface] = [SettingItemUIInfo(title: "Doors", state: DoorLockedState(descriptionText: "Locked"))]
}
