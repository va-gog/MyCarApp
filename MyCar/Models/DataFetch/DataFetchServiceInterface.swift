//
//  DataFetchServiceInterface.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import Foundation

protocol DataFetchServiceInterface {
    func fetchDataForCar(url: URL) async throws -> Data
}
