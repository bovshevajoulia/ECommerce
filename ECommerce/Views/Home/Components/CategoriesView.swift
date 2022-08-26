//
//  CategoriesView.swift
//  ECommerce
//
//  Created by bovsheva on 25.08.2022.
//

import SwiftUI

struct CategoriesView: View {
    
    @Binding var categorySelection: Int
    
    let categories = ProductCategory.dummyCategories
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 23) {
                
                ForEach(0 ..< categories.count, id: \.self) { number in
                    
                    VStack {
                        Button {
                            categorySelection = number
                        } label: {
                            Image(categorySelection == number ? categories[number].enable : categories[number].disable)
                                .frame(width: 14, height: 14, alignment: .center)
                        }
                        .buttonStyle(NeuStyle.CirclePrimaryButtonStyle(color: categorySelection == number ? NeuStyle.palette1 : NeuStyle.palette3, size: 71))
                        
                        Text(categories[number].title)
                            .foregroundColor(categorySelection == number ? NeuStyle.palette1 : NeuStyle.palette2)
                            .customFont(.caption)
                        
                    }
                }
            }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(categorySelection: .constant(0))
    }
}
