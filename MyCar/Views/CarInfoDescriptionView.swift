//
//  CarInfoDescriptionView.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct CarInfoDescriptionView: View {
    let car: CarDescriptionModel
    let styler: CarDescriptionViewStyle
    
    var body: some View {
        HStack(alignment: .center) {
            HStack {
                Spacer()
                Text("My")
                    .font(styler.carModelTextFont)
                Text(car.name)
                    .font(styler.carModelTextFont)
            }
            .fontWeight(.semibold)
                                
                Divider()
                    .frame(width: styler.dividerSize.width,
                           height: styler.dividerSize.height)
                    .background(styler.dividerColor)
            
            HStack(spacing: 0) {
                Image(Icon.gas.iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: styler.iconSize)
                
                Text(car.fuel)
                    .font(styler.carFuelTextFont)
                    .fontWeight(styler.carFuelTextWeight)
                Text("mi")
                    .font(styler.carFuelTextFont)
                    .fontWeight(styler.carFuelTextWeight)
                Spacer()
            }
            .fontWeight(.semibold)                                
                
                Spacer()
                
            }
            .padding(0)
            .frame(height: styler.containerHeight)
    }
}
