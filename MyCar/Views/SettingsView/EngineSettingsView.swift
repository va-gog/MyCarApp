//
//  EngineSettingsView.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import SwiftUI

struct EngineSettingsView: View {
    @Binding var engineState: SettingItemStateInterface

    let onStartedButtonTapped: () -> Void
    let onStoppedButtonTapped: () -> Void
    
    var body: some View {
        if let engineState = engineState as? EngineStateInterface {
            HStack(spacing: engineState.uiFixedState.spacing) {
                Spacer()
                engineButton(title: engineState.uiFixedState.leftButtonTitle,
                             attributes: engineState.uiFixedState,
                             foregroundColor: engineState.uiChangableState.leftButtonTextColor,
                             backgroundColor: engineState.uiChangableState.leftButtonBackground,
                             action: onStartedButtonTapped)
                
                engineButton(title: engineState.uiFixedState.rightButtonTitle,
                             attributes: engineState.uiFixedState,
                             foregroundColor: engineState.uiChangableState.rightButtonTextColor,
                             backgroundColor: engineState.uiChangableState.rightButtonBackground,
                             action: onStartedButtonTapped)
                Spacer()
            }
            .padding(.vertical, engineState.uiFixedState.horizontalPadding)
            .background(engineState.uiFixedState.backgroundColor)
        }
    }
    
    private func engineButton(title: String, attributes: EngineUIFixedAttributes, foregroundColor: Color, backgroundColor: Color, action: @escaping () -> Void) -> some View {
        self.modifier(EngineSettingButtonModifier(title: title,
                                         attributes: attributes,
                                         foregroundColor: foregroundColor,
                                         backgroundColor: backgroundColor,
                                         action: action))
    }
}
