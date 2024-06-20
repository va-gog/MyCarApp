//
//  DoorsSettingsView.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import SwiftUI

struct DoorsSettingsView: View {
    var onLockedButtonTapped: () -> Void
    var onUnlockedButtonTapped: () -> Void
    
    @Binding var doorState: SettingItemStateInterface

    var body: some View {
        if let doorState = doorState as? DoorStateInterface {
            HStack(spacing: 7) {
                Spacer()
                let isInProgress = doorState.state == .locking || doorState.state == .unlocking
                if !isInProgress {
                    CustomButtonView {
                        Image(Icon.locked.iconName)
                            .resizable()
                            .background( doorState.state == .unlocked ? Color(hex: ProjectColorSpecs.lightGray) : .black)
                    } action: {
                        onLockedButtonTapped()
                    }
                } else {
                    CircularLoadingView(color: Color(hex: ProjectColorSpecs.lightBrown), lineWidth: 5, frameSize: 65)
                }
                
                CustomButtonView {
                    Image(Icon.unlocked.iconName)
                        .resizable()
                        .background(isInProgress ? Color(hex: ProjectColorSpecs.lightGray) : .black)
                    
                } action: {
                    onUnlockedButtonTapped()
                }
                Spacer()
            }
            .padding(.top, 15)
            .padding(.bottom, 15)
            .background(Color.white)
        }
    }
}
