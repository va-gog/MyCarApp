//
//  SettingsButtonFactory.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import SwiftUI

class SettingsButtonFactory {
    @ViewBuilder
    static func makeView(for state: SettingItemStateInterface, buttonAction: ((ButtonType) -> Void)?) -> some View {
        if state is DoorStateInterface {
            DoorsSettingsView(onLockedButtonTapped: {
                buttonAction?(.lock)
            }, onUnlockedButtonTapped: {
                buttonAction?(.unlock)
            }, doorState: Binding(get: { state as! DoorStateInterface }, set: { newValue in }))
        } else if state is EngineStateInterface {
            EngineSettingsView(engineState: Binding(get: { state as! EngineStateInterface }, set: { newValue in }), onStartedButtonTapped: {
                buttonAction?(.start)
            }, onStoppedButtonTapped: {
                buttonAction?(.stop)
            })
        } else {
            EmptyView()
        }
    }
}
