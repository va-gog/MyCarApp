//
//  PaginationView.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct PaginationView: View {
    let currentIndex: Int
    let totalImages: Int
    let pageCount: Int

    var body: some View {
        HStack(spacing: 10) {
            // Left Plus View

                if currentIndex >= pageCount && totalImages > pageCount  {
                    Text("+")
                        .foregroundColor(.gray)
                } else {
                    Text("+")
                        .hidden()
                }
           

            // Paging Rectangles
            let maxPagCount = min(pageCount, totalImages)
            ForEach(0..<maxPagCount, id: \.self) { index in

                    Rectangle()
                    .fill(currentIndex == index ? Color(hex: 0xA66A53) : .gray)
                        .frame(width: 30, height: 2)
            }

            // Right Plus View
            if currentIndex < pageCount && totalImages > pageCount {
                Text("+")
                    .foregroundColor(.gray)
            } else {
                Text("+")
                    .hidden()
            }
        }
        .animation(.easeInOut(duration: 0.3), value: currentIndex)
        .padding(.top, 10)
    }
}
