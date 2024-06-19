//
//  DataFetchService.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

/* Lets consider that this is a third part library that we use to fetch
 data and we don't have access to internal implementation */
struct DataFetchService {
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

