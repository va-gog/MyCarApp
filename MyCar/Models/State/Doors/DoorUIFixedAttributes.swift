//
//  DoorUIFixedAttributes.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import SwiftUI

struct DoorUIFixedAttributes {
    let leftIcon = Icon.locked.iconName
    let rightIcon = Icon.unlocked.iconName
    let backgroundColor = Color.white
    let horizontalPadding: CGFloat = 15
    let buttonSize = CGSize(width: 65, height: 65)

    let iconSize = CGSize(width: 40, height: 40)
    
    let circleColor = Color(hex: ProjectColorSpecs.lightBrown)
    let circleWidth: CGFloat = 2
    let animationDuration: CGFloat = 1
}