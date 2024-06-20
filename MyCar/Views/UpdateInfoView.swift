//
//  RefreshableView.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct RefreshableView: View {
    @State private var lastUpdateTime: Date = Date()
    @State private var timeSinceLastUpdate: String = NSLocalizedString("Updated just now", comment: "")

    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                refreshData()
            }) {
                Image(Icon.refresh.iconName)
                        .resizable()
                        .frame(width: 24, height: 24)
            }

            Text(timeSinceLastUpdate)
                .font(.subheadline)

            Spacer()
        }
        .padding()
        .onAppear {
            updateTimeSinceLastUpdate()
        }
    }

    private func refreshData() {
        lastUpdateTime = Date()
        updateTimeSinceLastUpdate()
    }

    private func updateTimeSinceLastUpdate() {
            let now = Date()
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .full
            formatter.allowedUnits = [.minute, .hour, .day]
            formatter.maximumUnitCount = 1

            if let formattedString = formatter.string(from: lastUpdateTime, to: now) {
                timeSinceLastUpdate = "Updated \(formattedString) ago"
            } else {
                timeSinceLastUpdate = "Updated just now"
            }
        }
}
