//
//  TabbarView.swift
//  ECommerce
//
//  Created by bovsheva on 25.08.2022.
//

import SwiftUI

struct TabbarView: View {
    
    @Binding var selection: Int
    
    var icons: [String] = [
        "Explorer",
        "basket",
        "heart",
        "person"
    ]
    
    var body: some View {
        
        ZStack {
            
            NeuStyle.palette2
                .ignoresSafeArea()
            
            HStack(spacing: 26) {
                
                buttonExplorer
                
                buttonBasket
                
                buttonFavorites
                
                buttonPerson
            }
            .padding(.vertical, 26)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .frame(height: 72)
        .mask {
            RoundedRectangle(cornerRadius: 30,
                             style: .continuous)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea(edges: .bottom)
    }
    
    var buttonExplorer: some View {
        Button("") {
            selection = 0
        }
        .buttonStyle(NeuStyle.TabbarTextButtonStyle(textWidth: 80,
                                                    textHeight: 19,
                                                    isSelected: selection == 0,
                                                    text: icons[0])
        )
    }
    
    var buttonBasket: some View {
        Button("") {
            selection = 1
        }
        .buttonStyle(NeuStyle.TabbarImageButtonStyle(size: 18,
                                                     isSelected: selection  == 1,
                                                     imageName: icons[1])
        )
    }
    
    var buttonFavorites: some View {
        Button("") {
            selection = 2
        }
        .buttonStyle(NeuStyle.TabbarImageButtonStyle(size: 18,
                                                     isSelected: selection  == 2,
                                                     imageName: icons[2])
        )
    }
    
    var buttonPerson: some View {
        Button("") {
            selection = 3
        }
        .buttonStyle(NeuStyle.TabbarImageButtonStyle(size: 18,
                                                     isSelected: selection  == 3,
                                                     imageName: icons[3])
        )
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(selection: .constant(0))
    }
}
