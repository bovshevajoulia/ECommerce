//
//  ProductDetailsView.swift
//  ECommerce
//
//  Created by bovsheva on 25.08.2022.
//

import SwiftUI

struct ProductDetailsView: View {
    
    @Binding var show: Bool
    
    var body: some View {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(show: .constant(true))
    }
}
