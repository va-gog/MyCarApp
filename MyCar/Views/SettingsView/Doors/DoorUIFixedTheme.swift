//
//  DoorUIFixedTheme.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import Foundation

struct DoorUIFixedTheme {
    let leftIcon = Icon.locked.iconName
    let rightIcon = Icon.unlocked.iconName
    let backgroundColor = HexColorSpec.white
    let horizontalPadding: CGFloat = 15
    let spacing: CGFloat = 7
    
    let circleColor = HexColorSpec.lightBrown
    let circleWidth: CGFloat = 2
    let animationDuration: CGFloat = 1
    
    let butonTheme = DoorButtonTheme()
}
