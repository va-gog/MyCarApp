//
//  DataFetchService.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

/* For this project this function will asyncronius decode the CarData JSON,
 but in the real project it will fetch data from server with some info -
 for example our car.
 The reason why I use ascyn function here is to simulate real project */

struct DataFetchService: DataFetchServiceInterface {
    func fetchDataForCar(url: URL) async throws -> Data {
        do {
            return try Data(contentsOf: url)
        } catch {
            throw FetchServiceError.serialization
        }
    }
    
    enum FetchServiceError: Error {
        case serialization
        case unknown
    }
}
