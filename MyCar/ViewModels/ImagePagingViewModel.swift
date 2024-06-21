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
    var currentIndex: CurrentValueSubject<Int, Never>
    
    let images: [String]
    let pagesCount: Int
    
    init(images: [String], pagesCount: Int, currentIndex: CurrentValueSubject<Int, Never>) {
        self.images = images
        self.pagesCount = min(pagesCount, images.count)
        self.currentIndex = currentIndex
    }
    
    func handleGesture(translationX: CGFloat, geometryWidth: CGFloat) {
        let offset = translationX / geometryWidth
        let index = (CGFloat(currentIndex.value) - offset).rounded()
        let newIndex = min(max(Int(index), 0), images.count - 1)
        if  newIndex != currentIndex.value, translationX != 0 {
            currentIndex.send(newIndex)
        }
    }
    
    func validTranslation(translationX: CGFloat) -> CGFloat {
        if currentIndex.value == 0 && translationX > 0 {
            return 0
        } else if currentIndex.value == images.count - 1 && translationX < 0 {
            return 0
        } else {
            return translationX
        }
    }
    
        private var shouldShowLeftPlus: Bool {
            return currentIndex.value >= pagesCount && images.count > pagesCount
        }
    
        private var shouldShowRightPlus: Bool {
            return currentIndex.value < pagesCount && images.count > pagesCount
        }
}
