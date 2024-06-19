//
//  CarDataFetchServiceProtocol.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

protocol CarDataFetchServiceProtocol {
    func fetchDataForCar(url: URL) async throws -> CarModel
}
