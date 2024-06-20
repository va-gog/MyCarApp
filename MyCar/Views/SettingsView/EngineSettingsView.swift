//
//  EngineSettingsView.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import SwiftUI

struct EngineSettingsView: View {
    var onStartedButtonTapped: () -> Void
    var onStoppedButtonTapped: () -> Void
    
    @Binding var engineState: SettingItemStateInterface

    var body: some View {
        HStack(spacing: 7) {
                Spacer()
                CustomButtonView {
                    Text("START")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white)
                } action: {
                    onStartedButtonTapped()
                }
                
                CustomButtonView {
                    Text("STOP")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white)
                } action: {
                    onStoppedButtonTapped()
                }
                Spacer()
            }
        .padding(.top, 15)
        .padding(.bottom, 15)
        .background(Color.white)
    }
}
