//
//  CarDescriptionView.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct CarDescriptionView: View {
    private let car: CarDescriptionModel
    
    private let styler: CarDescriptionViewStyle
    
    init(car: CarDescriptionModel, styler: CarDescriptionViewStyle = CarDescriptionViewStyle()) {
        self.car = car
        self.styler = styler
    }
    
    var body: some View {
        HStack(alignment: .center) {
            leftContainer
            
            divider
            
            rightContainer
            
            Spacer()
            
        }
        .padding(0)
        .frame(height: styler.containerHeight)
    }
    
    private var leftContainer: some View {
        HStack {
            Spacer()
            Text("My")
                .font(styler.carModelTextFont)
            Text(car.name)
                .font(styler.carModelTextFont)
        }
        .fontWeight(.semibold)
    }
    
    private var rightContainer: some View {
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
    }
    
    private var divider: some View {
        Divider()
            .frame(width: styler.dividerSize.width,
                   height: styler.dividerSize.height)
            .background(styler.dividerColor)
    }
    
}
