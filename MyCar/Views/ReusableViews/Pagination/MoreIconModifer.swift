//
//  MoreIconModifer.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import SwiftUI

struct MoreIconModifer: ViewModifier {
    @Binding  var isVisible: Bool

    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
            .opacity(isVisible ? 1 : 0)
    }
}
