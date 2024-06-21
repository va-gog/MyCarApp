//
//  PaginationView.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct PaginationView: View {
    private let rectangleWidth: CGFloat = 30
    private let rectangleHeight: CGFloat = 2
    private let spacing: CGFloat = 10
    private let animationDuration: Double = 0.3
    
    private let currentIndex: Int
    private let totalImages: Int
    private let pageCount: Int
    
    init(currentIndex: Int, totalImages: Int, pageCount: Int) {
        self.currentIndex = currentIndex
        self.totalImages = totalImages
        self.pageCount = pageCount
    }

    var body: some View {
        HStack(spacing: spacing) {
            leftPlusView

            pagingRectangles

            rightPlusView
        }
        .animation(.easeInOut(duration: animationDuration), value: currentIndex)
        .padding(.top, 10)
    }

    private var leftPlusView: some View {
        Text("+")
            .foregroundColor(.gray)
            .opacity(shouldShowLeftPlus ? 1 : 0)
    }

    private var pagingRectangles: some View {
        let maxPagCount = min(pageCount, totalImages)
        return ForEach(0..<maxPagCount, id: \.self) { index in
            Rectangle()
                .fill(shouldShowSelected(index: index) ? Color(hex: 0xA66A53) : .gray)
                .frame(width: rectangleWidth, height: rectangleHeight)
        }
    }

    private var rightPlusView: some View {
        Text("+")
            .foregroundColor(.gray)
            .opacity(shouldShowRightPlus ? 1 : 0)
    }
    
    // remove into interface
    private func shouldShowSelected(index: Int) -> Bool {
        return currentIndex == index || (index == pageCount - 1 && currentIndex > index)
    }

    private var shouldShowLeftPlus: Bool {
        return currentIndex >= pageCount && totalImages > pageCount
    }

    private var shouldShowRightPlus: Bool {
        return currentIndex < pageCount && totalImages > pageCount
    }
}
