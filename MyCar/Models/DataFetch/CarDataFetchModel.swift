//
//  CarDataFetchModel.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

struct CarDataFetchModel: CarDataFetchServiceProtocol {
    private let fetchService: DataFetchServiceInterface
    
    init(fetchService: DataFetchServiceInterface) {
        self.fetchService = fetchService
    }

    func fetchDataFor(_ item: String, url: URL) async throws -> CarModel {
        do {
            let data = try await fetchService.fetchDataForCar(url: url)
            let decoder = JSONDecoder()
            
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            if let jsonDict = jsonObject as? [String: Any],
               let carDict = jsonDict[item] as? [String: Any] {
                
                let carData = try JSONSerialization.data(withJSONObject: carDict, options: [])
                return try decoder.decode(CarModel.self, from: carData)
            }
            throw FetchError.serialization
        } catch {
            throw FetchError.serialization
        }
    }
}
