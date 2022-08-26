//
//  NeuButtonStyleGuide.swift
//  ECommerce
//
//  Created by bovsheva on 25.08.2022.
//

import SwiftUI

struct NeuButtonStyleGuide: View {
    var body: some View {
        
        ZStack {
            
            NeuStyle.palette2
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Text("TabbarImageButtonStyle: ")
                    .foregroundColor(.white)
                
                Button("") {
                    
                }
                .buttonStyle(NeuStyle.TabbarImageButtonStyle(size: 18,
                                                             isSelected: true,
                                                             imageName: "heart")
                )
                
                Button("") {
                    
                }
                .buttonStyle(NeuStyle.TabbarImageButtonStyle(size: 18,
                                                             isSelected: false,
                                                             imageName: "heart")
                )
                
                Button("") {
                    
                }
                .buttonStyle(NeuStyle.TabbarTextButtonStyle(textWidth: 75,
                                                            textHeight: 20,
                                                            isSelected: true,
                                                            text: "Explorer")
                )
                
                Button("") {
                    
                }
                .buttonStyle(NeuStyle.TabbarTextButtonStyle(textWidth: 80,
                                                            textHeight: 20,
                                                            isSelected: false,
                                                            text: "Explorer")
                )
                
                Button {
                    
                } label: {
                    Text("button")
                        .frame(width: 100, height: 37)
                }
                .buttonStyle(NeuStyle.PrimaryButtonStyle())
                
                Button {
                    
                } label: {
                    Text("primary button style")
                }
                .buttonStyle(NeuStyle.PrimaryButtonStyle())
                .disabled(true)
            }
        }
    }
}

extension NeuStyle {
    
    struct PrimaryButtonStyle: ButtonStyle {
        @Environment(\.isEnabled) var isEnabled
        
        var background: Color = NeuStyle.palette1
        var cornerRadius: CGFloat = 10
        
        var backgroundColor: Color {
            isEnabled ? background : NeuStyle.disabledButtonColor
        }
        
        var textColor: Color {
            isEnabled ? NeuStyle.buttonTextEnableColor : NeuStyle.buttonTextDisableColor
        }
        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .customFont(.headline2)
                .foregroundColor(textColor)
                //.frame(maxWidth: .infinity, alignment: .center)
                .background(RoundedRectangle(cornerRadius: cornerRadius,
                                             style: .continuous)
                                .fill(backgroundColor)
                )
                .scaleEffect(configuration.isPressed ? 0.95 : 1)
                .animation(.easeOut(duration: 0.2),
                           value: configuration.isPressed
                )
        }
        
    }
    
    struct TabbarImageButtonStyle: ButtonStyle {
        let size: CGFloat
        let isSelected: Bool
        let imageName: String
        
        func makeBody(configuration: Configuration) -> some View {
            
            configuration.label
                .frame(width: 34, height: 20)
                .modifier(NeuStyle.TabbarImageStyle(size: size,
                                                    isSelected: isSelected,
                                                    imageName: imageName)
                )
            
        }
    }
    
    struct TabbarTextStyle: ViewModifier {
        let textWidth: CGFloat
        let textHeight: CGFloat
        let isSelected: Bool
        let circleSize: CGFloat = 8
        let text: String
        
        var contentWidth: CGFloat {
            textWidth + circleSize
        }
        
        func body(content: Content) -> some View {
            content
                .background(
                    
                    HStack {
                        
                        Circle()
                            .frame(width: circleSize,
                                   height: circleSize,
                                   alignment: .leading
                            )
                            .foregroundColor(NeuStyle.tabbarIconColor)
                            .opacity(isSelected ? 1.0 : 0)
                        
                        Text(text)
                            .foregroundColor(NeuStyle.tabbarIconColor)
                    }
                        .frame(width: contentWidth, height: textHeight)
                )
        }
    }
    
    struct TabbarTextButtonStyle: ButtonStyle {
        let textWidth: CGFloat
        let textHeight: CGFloat
        let isSelected: Bool
        let text: String
        
        func makeBody(configuration: Configuration) -> some View {
            
            configuration.label
                .frame(width: 80, height: 20)
                .modifier(NeuStyle.TabbarTextStyle(textWidth: textWidth,
                                                   textHeight: textHeight,
                                                   isSelected: isSelected,
                                                   text: text)
                )
            
        }
    }
    
    struct TabbarImageStyle: ViewModifier {
        
        let size: CGFloat
        let isSelected: Bool
        let imageName: String
        let circleSize: CGFloat = 8
        
        var contentWidth: CGFloat {
            size + circleSize * 2
        }
        
        func body(content: Content) -> some View {
            content
                .background(
                    
                    HStack {
                        
                        Circle()
                            .frame(width: circleSize,
                                   height: circleSize,
                                   alignment: .leading
                            )
                            .foregroundColor(NeuStyle.tabbarIconColor)
                            .opacity(isSelected ? 1.0 : 0)
                        
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: size,
                                   height: size,
                                   alignment: .trailing
                            )
                        
                    }
                        .frame(width: contentWidth, height: size)
                )
        }
    }
}

struct NeuButtonStyleGuide_Previews: PreviewProvider {
    static var previews: some View {
        NeuButtonStyleGuide()
    }
}
