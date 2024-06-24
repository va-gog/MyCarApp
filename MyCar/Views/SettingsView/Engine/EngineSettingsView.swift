//
//  EngineSettingsView.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import SwiftUI

struct EngineUIFixedAttributes {
    let backgroundColor = Color.white
    let horizontalPadding: CGFloat = 15
    let spacing: CGFloat = 7
    
    let leftButtonTitle = "START"
    let rightButtonTitle = "STOP"
    
    let buttonTheme = EngineButtonTheme()
}

struct EngineButtonTheme {
    let font = Font.system(size: 12, weight: .medium)
    let textSize = CGSize(width: 40, height: 40)
    let buttonSize = CGSize(width: 65, height: 65)
}

struct EngineSettingsView: View {
    @Binding var engineState: EngineItemUIInfo

    let onStartedButtonTapped: () -> Void
    let onStoppedButtonTapped: () -> Void
    
    let theme = EngineUIFixedAttributes()
    
    var body: some View {
            HStack(spacing: theme.spacing) {
                Spacer()
                engineButton(title: theme.leftButtonTitle,
                             theme: theme.buttonTheme,
                             foregroundColor: engineState.uiChangableState.leftButtonTextColor,
                             backgroundColor: engineState.uiChangableState.leftButtonBackground,
                             action: onStartedButtonTapped)
                
                engineButton(title: theme.rightButtonTitle,
                             theme: theme.buttonTheme,
                             foregroundColor: engineState.uiChangableState.rightButtonTextColor,
                             backgroundColor: engineState.uiChangableState.rightButtonBackground,
                             action: onStartedButtonTapped)
                Spacer()
            }
            .padding(.vertical, theme.horizontalPadding)
            .background(theme.backgroundColor)
    }
    
    private func engineButton(title: String, theme: EngineButtonTheme, foregroundColor: Color, backgroundColor: Color, action: @escaping () -> Void) -> some View {
        self.modifier(EngineSettingButtonModifier(title: title,
                                         theme: theme,
                                         foregroundColor: foregroundColor,
                                         backgroundColor: backgroundColor,
                                         action: action))
    }
}
