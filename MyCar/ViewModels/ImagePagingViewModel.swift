//
//  ImagePagingViewModel.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import SwiftUI

class ImagePagingViewModel: ObservableObject {
    @Published var currentIndex = 0
    
    let images: [String]
    
    init(images: [String]) {
        self.images = images
    }
    
    func handleGesture(translationX: CGFloat, geometryWidth: CGFloat) {
        let offset = translationX / geometryWidth
        let newIndex = (CGFloat(currentIndex) - offset).rounded()
        currentIndex = min(max(Int(newIndex), 0), images.count - 1)
    }
    
    func validTranslation(translationX: CGFloat) -> CGFloat {
        if currentIndex == 0 && translationX > 0 {
            return 0
        } else if currentIndex == images.count - 1 && translationX < 0 {
            return 0
        } else {
            return translationX
        }
    }
}
