//
//  HotSalesView.swift
//  ECommerce
//
//  Created by bovsheva on 25.08.2022.
//

import SwiftUI

struct HotSalesView: View {
    
    @Binding var items: [StoreProduct]
    
    var body: some View {
        
        VStack {
            
            captionView
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 23) {
                    
                    ForEach(0 ..< items.count, id: \.self) { number in
                        
                        HotSalesCardView(item: items[number])
                    }
                }
            }
        }
    }
    
    private var captionView: some View {
        HStack {
            hotSalesText
            
            Spacer()
            
            seeMore
                .padding(.horizontal, 15)
        }
        .padding(.horizontal, 15)
    }
    
    private var seeMore: some View {
        Text("see more")
            .foregroundColor(NeuStyle.palette1)
            .customFont(.subheadline)
    }
    
    private var hotSalesText: some View {
        Text("Hot sales")
            .foregroundColor(NeuStyle.palette2)
            .customFont(.title)
    }
}

struct HotSalesView_Previews: PreviewProvider {
    static var previews: some View {
        HotSalesView(items: .constant(StoreProduct.dummyProducts()))
    }
}
