//
//  FetchServiceMock.swift
//  MyCarTests
//
//  Created by Gohar Vardanyan on 6/24/24.
//

import Foundation

import Foundation
import XCTest
@testable import MyCar

final class MockFetchService: DataFetchServiceInterface {
    var result: Result<Data, Error>?

    func fetchDataForCar(url: URL) async throws -> Data {
        if let result = result {
            switch result {
            case .success(let data):
                return data
            case .failure(let error):
                throw error
            }
        }
        throw FetchError.unknown
    }
}
