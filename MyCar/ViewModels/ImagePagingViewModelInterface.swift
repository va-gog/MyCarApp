//
//  ImagePagingViewModelInterface.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import Foundation
import Combine

protocol ImagePagingViewModelInterface {
    var currentIndex: CurrentValueSubject<Int, Never> { get }
    func handleGesture(translationX: CGFloat, geometryWidth: CGFloat)
    func validTranslation(translationX: CGFloat) -> CGFloat
}
