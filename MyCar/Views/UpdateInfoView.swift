//
//  RefreshableView.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct RefreshableView: View {
    @Binding var timeSinceLastUpdate: String?
    
    private let iconSize: CGFloat = 24
    
    var body: some View {
        HStack {
                Spacer()
                Button(action: {
                    refreshData()
                }) {
                    Image(Icon.refresh.iconName)
                        .resizable()
                        .frame(width: iconSize, height: iconSize)
                }
                
                Text("Updated \(timeSinceLastUpdate ?? "") ago")
                    .font(.subheadline)
                Spacer()
        }
    }

    private func refreshData() {
        timeSinceLastUpdate = nil
    }
}
