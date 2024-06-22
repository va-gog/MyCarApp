//
//  FetchState.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import Foundation

enum FetchState: Equatable {
    case loading
    case finished
    case error(FetchError)
    
    static func == (lhs: FetchState, rhs: FetchState) -> Bool {
            switch (lhs, rhs) {
            case (.loading, .loading):
                return true
            case (.finished, .finished):
                return true
            case (.error(let lhsError), .error(let rhsError)):
                return lhsError == rhsError
            default:
                return false
            }
        }
}
