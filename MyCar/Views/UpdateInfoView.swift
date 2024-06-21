//
//  RefreshableView.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct RefreshableView: View {
    @Binding var timeSinceLastUpdate: String?
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
                
                Text("Updated \(timeSinceLastUpdate ?? "") ago")
                    .font(.subheadline)
                
                Spacer()
        }
        .padding()
    }

    private func refreshData() {
        timeSinceLastUpdate = nil
    }
}
