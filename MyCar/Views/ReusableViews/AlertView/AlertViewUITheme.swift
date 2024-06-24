//
//  AlertViewUITheme.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import SwiftUI

struct AlertViewUITheme {
    let verticalSpaceing: CGFloat = 15
    let backgroundColor = Color.white
    let cornerRadius: CGFloat = 5
    let shadowRadius: CGFloat =  4
    let horizontalPadding: CGFloat = 10
    let alignment = Alignment.trailing
    
    let titleAttributes = AlertTitleUITheme(fontSize: Font.system(size: 18),
                                                 textColor: .black)
    let subtitleAttributes = AlertTitleUITheme(fontSize: Font.system(size: 12),
                                                    textColor: HexColorSpec.darkGray)
    let leftButtonAttributes = AlertButtonUITheme(background: .white,
                                                       textForegroundColor: .blue)
    let rightButtonAttributes = AlertButtonUITheme(background: .blue,
                                                        textForegroundColor: .white)
}
