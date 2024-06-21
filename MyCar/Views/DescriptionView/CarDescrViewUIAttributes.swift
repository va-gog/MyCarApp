//
//  CarDescrViewUIAttributes.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct CarDescrViewUIAttributes {
    let containerPadding: CGFloat = 0
    let containerHeight: CGFloat = 60

    let dividerColor = Color(hex: 0xA66A53)
    let dividerSize = CGSize(width: 2, height: 30)

    let carNameTextWeight = Font.Weight.semibold
    let carModelTextFont = Font.title3
    let carFuelTextFont = Font.subheadline
    let carFuelTextWeight = Font.Weight.bold
    
    let iconHeight: CGFloat = 35
}
