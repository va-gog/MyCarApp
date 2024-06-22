//
//  ImagePagingViewModel.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import SwiftUI
import Combine

final class ImagePagingViewModel: ImagePagingViewModelInterface, ObservableObject {
    @Published var shouldShowLeftIcon: Bool = false
    @Published var shouldShowRightIcon: Bool = false
    @Published var selectedIndex: Int = 0
    
    var currentIndexSubject: CurrentValueSubject<Int, Never>
    let images: [String]
    let pagesCount: Int
    
    private var cancellables = Set<AnyCancellable>()
    
    init(images: [String], pagesCount: Int, currentIndexSubject: CurrentValueSubject<Int, Never>) {
        self.images = images
        self.pagesCount = min(pagesCount, images.count)
        self.currentIndexSubject = currentIndexSubject
        self.showLeftIconIfNeeded()
        self.showRightIconIfNeeded()
        self.changeSelectedIndex()
        
        currentIndexSubject.sink { [weak self] _ in
            self?.showLeftIconIfNeeded()
            self?.showRightIconIfNeeded()
            self?.changeSelectedIndex()
        }.store(in: &cancellables)
    }
    
    func handleGesture(translationX: CGFloat, geometryWidth: CGFloat) {
        let offset = translationX / geometryWidth
        let index = (CGFloat(currentIndexSubject.value) - offset).rounded()
        let newIndex = min(max(Int(index), 0), images.count - 1)
        if  newIndex != currentIndexSubject.value, translationX != 0 {
            currentIndexSubject.send(newIndex)
        }
    }
    
    func validTranslation(translationX: CGFloat) -> CGFloat {
        if currentIndexSubject.value == 0 && translationX > 0 {
            return 0
        } else if currentIndexSubject.value == images.count - 1 && translationX < 0 {
            return 0
        } else {
            return translationX
        }
    }
    
    private func showLeftIconIfNeeded() {
        self.shouldShowLeftIcon = currentIndexSubject.value >= pagesCount
    }
    
    private func showRightIconIfNeeded() {
        shouldShowRightIcon = currentIndexSubject.value < pagesCount
    }
    
    private func changeSelectedIndex() {
        selectedIndex = min(pagesCount - 1, currentIndexSubject.value)
    }
}
