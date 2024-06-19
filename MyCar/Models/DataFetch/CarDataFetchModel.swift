//
//  CarDataFetchModel.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

struct CarDataFetchModel: CarDataFetchServiceProtocol {
    private let fetchService: DataFetchService
    
    init(fetchService: DataFetchService) {
        self.fetchService = fetchService
    }
    
    /* For this project this function will asyncronius decode the CarData JSON,
     but in the real project it will fetch data from server with some info -
     for example our car.
     The reason why I use ascyn function here is to simulate real project */
    func fetchDataForCar(url: URL) async throws -> CarModel {
        do {
            let data = try await fetchService.fetchDataForCar(url: url)
            let decoder = JSONDecoder()
            
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            if let jsonDict = jsonObject as? [String: Any],
               let carDict = jsonDict["car"] as? [String: Any] {
                
                let carData = try JSONSerialization.data(withJSONObject: carDict, options: [])
                return try decoder.decode(CarModel.self, from: carData)
            }
            throw CarFetchError.serialization
        } catch {
            throw CarFetchError.serialization
        }
    }
}
