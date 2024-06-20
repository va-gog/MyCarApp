//
//  ImagesCollectionView.swift
//  MyCarApp
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct ImagesCollectionView: View {
    @ObservedObject var viewModel: ImagePagingViewModel
    
    @GestureState private var translation: CGFloat = 0
    @State private var showRefreshOverlay: Bool = false
    
    private let imageHeight: CGFloat = 255
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    ForEach(viewModel.images.indices, id: \.self) { index in
                        imageForIndex(index)
                            .frame(width: geometry.size.width, height: imageHeight)
                    }
                }
                .frame(width: geometry.size.width * CGFloat(viewModel.images.count),
                       alignment: .leading)
                .offset(x: -CGFloat(viewModel.currentIndex) * geometry.size.width)
                .offset(x: viewModel.validTranslation(translationX: translation))
                .animation(.interactiveSpring(),
                           value: viewModel.currentIndex)
                .gesture(dragGesture(geometry: geometry))
            }
            .frame(height: imageHeight)
            .overlay(paginationOverlay,
                     alignment: .bottom)
            .overlay(
                refreshOverlay
                    .opacity(showRefreshOverlay ? 1 : 0)
                    .animation(.easeInOut, value: showRefreshOverlay)
                    .padding(.top, 0),
                alignment: .top
            )
        }
    }
    
    private func imageForIndex(_ index: Int) -> some View {
        Image(viewModel.images[index],
              bundle: nil)
        .resizable()
        .scaledToFill()
        .clipped()
    }
    
    private var paginationOverlay: some View {
        PaginationView(currentIndex: viewModel.currentIndex,
                       totalImages: viewModel.images.count,
                       pageCount: 3)
        .offset(y: -15)
        
    }
    
    private var refreshOverlay: some View {
        RefreshableView()
            .offset(y: 12)
    }
    
    private func dragGesture(geometry: GeometryProxy) -> some Gesture {
        DragGesture()
            .updating(self.$translation) { value, state, _ in
                state = value.translation.width
            }
            .onEnded { value in
                viewModel.handleGesture(translationX: value.translation.width, geometryWidth: geometry.size.width)
            }
    }
}
