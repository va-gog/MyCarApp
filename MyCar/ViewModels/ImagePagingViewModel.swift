//
//  ImagePagingViewModel.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import SwiftUI
import Combine

final class ImagePagingViewModel: ObservableObject {
    var currentIndex: CurrentValueSubject<Int, Never>
    
    let images: [String]
    
    init(images: [String], currentIndex: CurrentValueSubject<Int, Never>) {
        self.images = images
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
}
