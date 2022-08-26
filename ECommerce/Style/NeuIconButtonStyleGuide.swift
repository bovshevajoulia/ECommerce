//
//  NeuIconButtonStyleGuide.swift
//  ECommerce
//
//  Created by bovsheva on 25.08.2022.
//

import SwiftUI

struct NeuIconButtonStyleGuide: View {
    var body: some View {
        
        VStack(spacing: 20) {
            Text("NeuIconButtonStyleGuide")
            
            Button {} label: {
                Image("basket")
                    .frame(width: 14, height: 14, alignment: .center)
            }
            .buttonStyle(NeuStyle.IconPrimaryButtonStyle(color: NeuStyle.palette1))
            
            Button {} label: {
                Image(systemName: "xmark")
                    .frame(width: 14, height: 14, alignment: .center)
            }
            .buttonStyle(NeuStyle.IconPrimaryButtonStyle(color: NeuStyle.palette1))
            
            Button {} label: {
                Image("basket")
                    .frame(width: 14, height: 14, alignment: .center)
            }
            .buttonStyle(NeuStyle.IconPrimaryButtonStyle(color: NeuStyle.palette1))
            .disabled(true)
            
            Button {} label: {
                Image("basket")
                    .frame(width: 14, height: 14, alignment: .center)
            }
            .buttonStyle(NeuStyle.CirclePrimaryButtonStyle(color: NeuStyle.palette1, size: 34)
            )
            
            Button {} label: {
                Image("health-enable")
                    .frame(width: 14, height: 14, alignment: .center)
            }
            .buttonStyle(NeuStyle.CirclePrimaryButtonStyle(color: NeuStyle.palette1, size: 71)
            )
            
            Button {} label: {
                Image("health-disable")
                    .frame(width: 14, height: 14, alignment: .center)
            }
            .buttonStyle(NeuStyle.CirclePrimaryButtonStyle(color: NeuStyle.palette3, size: 71)
            )
        }
    }
}

extension NeuStyle {
    struct IconPrimaryButtonStyle: ButtonStyle {
        @Environment(\.isEnabled) var isEnabled
        
        let color: Color
        
        var backgroundColor: Color {
            isEnabled ? color : NeuStyle.disabledButtonColor
        }
        
        var textColor: Color {
            isEnabled ? NeuStyle.buttonTextEnableColor : NeuStyle.buttonTextDisableColor
        }
        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.system(size: 18)) // we сan use this for system icons
                .foregroundColor(textColor) // we сan use this for system icons
                .frame(width: 37, height: 37)
                .background(RoundedRectangle(cornerRadius: 10).fill(backgroundColor))
                .scaleEffect(configuration.isPressed ? 0.95 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
        
    }
    
    struct CirclePrimaryButtonStyle: ButtonStyle {
        @Environment(\.isEnabled) var isEnabled
        
        let color: Color
        let size: CGFloat
        
        var backgroundColor: Color {
            isEnabled ? color : NeuStyle.disabledButtonColor
        }
        
        var textColor: Color {
            isEnabled ? NeuStyle.buttonTextEnableColor : NeuStyle.buttonTextDisableColor
        }
        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(width: size, height: size)
                .background(Circle().fill(backgroundColor)
                                .shadow(color: NeuStyle.shadowColor, radius: 20)
                )
                .scaleEffect(configuration.isPressed ? 0.95 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
}

struct NewIconButtonStyleGuide_Previews: PreviewProvider {
    static var previews: some View {
        NeuIconButtonStyleGuide()
    }
}
