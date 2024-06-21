//
//  AlertViewUIAttributes.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import SwiftUI

struct AlertViewUIAttributes {
    let verticalSpaceing: CGFloat = 15
    let backgroundColor = Color.white
    let cornerRadius: CGFloat = 5
    let shadowRadius: CGFloat =  4
    let horizontalPadding: CGFloat = 10
    let alignment = Alignment.trailing
    
    let titleAttributes = AlertTitleUIAttributes(fontSize: Font.system(size: 18),
                                                 textColor: .black)
    let subtitleAttributes = AlertTitleUIAttributes(fontSize: Font.system(size: 12),
                                                    textColor: Color(hex: ProjectColorSpecs.darkGray))
    let leftButtonAttributes = AlertButtonUIAttributes(background: .white,
                                                       textForegroundColor: .blue)
    let rightButtonAttributes = AlertButtonUIAttributes(background: .blue,
                                                        textForegroundColor: .white)
}
