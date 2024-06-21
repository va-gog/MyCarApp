//
//  AlertView.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import SwiftUI

struct AlertView: View {
    @Binding var showModal: Bool

    var title: String
    var message: String
    var onCancel: () -> Void
    var onConfirm: () -> Void

    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text(title)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .padding(.leading, 30)
                Spacer()
            }
            HStack {
                Text(message)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.leading)
                    .padding([.leading, .trailing], 30)
                Spacer()
            }
            
            HStack(alignment: .center) {
                Spacer()
                Button(action: onCancel) {
                    Text("Cancel")
                        .foregroundColor(.blue)
                        .padding([.leading, .trailing], 15)
                }
                .frame(height: 30)
                
                Button(action: onConfirm) {
                    Text("Yes, Lock")
                        .foregroundColor(.white)
                        .padding([.leading, .trailing], 15)

                }
                .frame(height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.leading, 15)
            }
            .padding([.top, .bottom, .trailing], 15)
            
        }
        .background(Color.white)
        .cornerRadius(5)
        .shadow(radius: 4)
        .padding([.leading, .trailing], 30)

    }
}
