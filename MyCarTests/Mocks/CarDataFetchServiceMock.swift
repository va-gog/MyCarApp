//
//  CarDataFetchServiceMock.swift
//  MyCarTests
//
//  Created by Gohar Vardanyan on 6/22/24.
//

import Foundation
@testable import MyCar

struct CarDataFetchServiceMock: CarDataFetchServiceProtocol {
    var succeed = true
    
    func fetchDataFor(_ item: String, url: URL) async throws -> CarModel {
        if !succeed {
            throw NSError()
        }
        return CarModel(name: "name",
                        fuel: "fuel", images: [],
                        settings: SettingsModel(doors: DoorModel(title: "Doors",
                                                                 locked: true),
                                                engine: EngineModel(title: "Engine",
                                                                    started: true)))
    }
}
