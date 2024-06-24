//
//  DataFetchService.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

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
