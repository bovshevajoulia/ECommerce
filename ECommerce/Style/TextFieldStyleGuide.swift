//
//  TextFieldStyleGuide.swift
//  ECommerce
//
//  Created by bovsheva on 25.08.2022.
//

import SwiftUI

struct TextFieldStyleGuide: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("TextFieldStyleGuide")
            
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: .constant(""))
                    .customFont(.caption)
            }
            .frame(maxWidth: .infinity)
            .modifier(NeuStyle.TextIconFieldStyle(roundedCornes: 50,
                                                  background: NeuStyle.palette3,
                                                  foreground: NeuStyle.palette1))
        }
    }
}

extension NeuStyle {
    struct TextIconFieldStyle: ViewModifier {
        var roundedCornes: CGFloat
        var background: Color
        var foreground: Color
        
        func body(content: Content) -> some View {
            content
                .font(.system(size: 18))
                .foregroundColor(foreground)
                .padding(.vertical, 10)
                .padding(.horizontal, 24)
                .background(background)
                .cornerRadius(roundedCornes)
                .padding(3)
                .customFont(.caption)
                .shadow(color: NeuStyle.shadowColor, radius: 20)
        }
    }
}

struct TextFieldStyleGuide_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldStyleGuide()
    }
}
