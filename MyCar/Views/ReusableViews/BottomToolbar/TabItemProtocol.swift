//
//  TabItemProtocol.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import Foundation

protocol TabItem: CaseIterable, Hashable where AllCases: RandomAccessCollection {
    var title: String { get }
    var icon: String { get }
}
