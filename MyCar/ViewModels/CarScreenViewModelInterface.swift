//
//  CarScreenViewModelInterface.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import Foundation

protocol CarScreenViewModelInterface {
    func setupWithData(_ carData: CarModel)
    func fetchInfoWithURL(_ url: URL?) throws
    func buttonAction(buttonType: ButtonType)
}
