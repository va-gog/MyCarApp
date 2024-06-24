//
//  ContentView.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CarScreenViewModel()
    private let carDataURL = Bundle.main.url(forResource: "CarData", withExtension: "json")
    @State private var showModal = false
    
    private let backgroundColor = ColorSpec.lightGray.opacity(0.5)
    private let overlayBackground = Color.black.opacity(0.5)
    private let opacity: CGFloat = 0.5
    private let verticalSpaceing: CGFloat = 0
    private let paginationCount = 3
    private let progressViewText = "Loading..."
    
    var body: some View {
        ZStack(alignment: .top, content: {
            switch viewModel.fetchState {
            case .loading:
                ProgressView(progressViewText)
            case .finished:
                backgroundColor
                    .overlay {
                        VStack(spacing: verticalSpaceing) {
                            CarDescriptionView(car: viewModel.carDescription)
                                .background(.white)
                            
                            ImagesCollectionView(viewModel: ImagePagingViewModel(images: viewModel.carDescription.imagesNames,
                                                                                 pagesCount: paginationCount,
                                                                                 currentIndexSubject: viewModel.currentIndex),
                                                 showRefreshOverlay: $viewModel.updatedTime)
                            
                            CarSettingView(buttonAction: { buttonType in
                                withAnimation { [weak viewModel] in
                                    viewModel?.buttonAction(buttonType: buttonType)
                                }
                            }, settings: $viewModel.settingsStates)
                            
                            Spacer()
                            BottomBar<Tab>(selectedTab: .home, onTab: {_ in }).background(.white)
                        }
                        if let alertInfo = viewModel.alertViewInfo {
                            overlayBackground
                                .edgesIgnoringSafeArea(.all)
                            
                            AlertView(
                                showModal: $showModal,
                                title: alertInfo.title ?? "",
                                message: "\(alertInfo.subtitle ?? "")",
                                leftButtonText: alertInfo.cancel ?? "",
                                rightButtonText: alertInfo.apply ?? "",
                                onLeftButton: { [weak viewModel] in
                                    withAnimation {
                                        viewModel?.alertViewInfo = nil
                                    }
                                },
                                onRightButton: { [weak viewModel] in
                                    withAnimation {
                                        viewModel?.alertViewInfo = nil
                                        viewModel?.buttonAction(buttonType: .apply)
                                    }
                                }
                            )
                            .transition(.opacity)
                            .animation(.easeInOut, value: viewModel.alertViewInfo)
                            .zIndex(1)
                        }
                    }
                
                
            case .error(let error):
                Text(error.description)
                    .foregroundColor(.red)
            }
        })
        .onAppear {
           try? viewModel.fetchInfoWithURL(carDataURL)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
