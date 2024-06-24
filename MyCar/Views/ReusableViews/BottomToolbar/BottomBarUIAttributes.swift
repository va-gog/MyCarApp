//
//  BottomBarUIAttributes.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import SwiftUI

struct BottomBarUIAttributes {
    let toolbarBackground = Color.white
    let containerTopPadding: CGFloat = 10
    let interTabSpace: CGFloat = 40
    let tabTopPadding: CGFloat = 4
    
    let iconSize = CGSize(width: 24, height: 24)
    
    let textFont = Font.caption
    let textPadding = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)
    
    let selectedForgroundColor = ColorSpec.lightBrown
    let deselectedForgroundColor = Color.black
    
    let inidicatorAlignments: Alignment = .top
    let indicatorHeight: CGFloat = 2
    let indicatorColor = ColorSpec.lightBrown
    let indicatorMoveAnimDur: CGFloat = 0.3

}
