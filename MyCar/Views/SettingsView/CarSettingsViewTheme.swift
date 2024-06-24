//
//  CarSettingsViewTheme.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import Foundation
import SwiftUI

struct CarSettingsViewTheme {
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    let dividerWidth: CGFloat = 20
    let describeTextSize: CGFloat = 12
    let shadowOpacity: CGFloat = 0.2
    let shadowOffset = CGPoint(x: 0, y: 2)
    let shadowRadius: CGFloat = 5
    let settingItemRadius: CGFloat = 5
    let titleLeadingPadding: CGFloat = 5
    let titleVerticalPadding: CGFloat = 5
    let settingViewHorizontalPadding: CGFloat = 20
}

