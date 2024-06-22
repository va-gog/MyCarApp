//
//  FetchError.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation

enum FetchError: Error, Equatable {
    case serialization
    case unknown
    case serviceError(Error)
    
    var description: String {
        switch self {
        case .unknown:
            FetchErrorDescriptions.unknown
        case .serialization:
            FetchErrorDescriptions.serialization
        case .serviceError(let error):
            error.localizedDescription
        }
    }
    
    static func == (lhs: FetchError, rhs: FetchError) -> Bool {
        switch (lhs, rhs) {
        case (.serialization, .serialization):
            return true
        case (.unknown, .unknown):
            return true
        case (.serviceError(let lhsError), .serviceError(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        default:
            return false
        }
    }
}
