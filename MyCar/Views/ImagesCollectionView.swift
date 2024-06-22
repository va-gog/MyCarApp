//
//  ImagesCollectionView.swift
//  MyCarApp
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct ImagesCollectionView: View {
    @ObservedObject var viewModel: ImagePagingViewModel
    @Binding var showRefreshOverlay: String?
    @GestureState private var translation: CGFloat = 0
    
    private let imageHeight: CGFloat = 255
    private let paginationViewBottomInset: CGFloat = -15
    private let updateViewTopInset: CGFloat = 12
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    ForEach(viewModel.images.indices, id: \.self) { index in
                        imageForIndex(index)
                            .frame(width: geometry.size.width)
                            .frame(maxHeight: imageHeight)
                    }
                }
                .frame(width: geometry.size.width * CGFloat(viewModel.images.count),
                       alignment: .leading)
                .offset(x: -CGFloat(viewModel.currentIndexSubject.value) * geometry.size.width)
                .offset(x: viewModel.validTranslation(translationX: translation))
                .animation(.interactiveSpring(),
                           value: viewModel.currentIndexSubject.value)
            }

            .frame(maxHeight: imageHeight)
            .overlay(paginationOverlay,
                     alignment: .bottom)
            .overlay(
                refreshOverlay
                    .opacity(showRefreshOverlay != nil ? 1 : 0)
                    .animation(.easeInOut, value: showRefreshOverlay)
                    .padding(.top, 0),
                alignment: .top
            )
        }
        .background(Color.clear) // Make the entire ZStack interactive
                .contentShape(Rectangle()) 
        .gesture(dragGesture())

    }
    
    private func imageForIndex(_ index: Int) -> some View {
        Image(viewModel.images[index],
              bundle: nil)
        .resizable()
        .padding(.horizontal, 15)
        .padding(.vertical, 15)
        .scaledToFit()
        .clipped()
    }
    
    private var paginationOverlay: some View {
        PaginationView(
            selectedIndex: $viewModel.selectedIndex,
            shouldShowLeftPlus: $viewModel.shouldShowLeftIcon,
            shouldShowRightPlus: $viewModel.shouldShowRightIcon,
            pagesCount: viewModel.pagesCount)
        
        .offset(y: paginationViewBottomInset)
        
    }
    
    private var refreshOverlay: some View {
        RefreshableView(timeSinceLastUpdate: $showRefreshOverlay)
            .offset(y: updateViewTopInset)
    }
    
    private func dragGesture() -> some Gesture {
        DragGesture()
            .updating(self.$translation) { value, state, _ in
                state = value.translation.width
            }
            .onEnded { value in
                viewModel.handleGesture(translationX: value.translation.width, geometryWidth: UIScreen.main.bounds.width)
            }
    }
}
