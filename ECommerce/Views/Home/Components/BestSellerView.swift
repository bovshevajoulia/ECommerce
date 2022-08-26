//
//  BestSellerView.swift
//  ECommerce
//
//  Created by bovsheva on 25.08.2022.
//

import SwiftUI

struct BestSellerView: View {
    
    @Binding var items: [BestSellerProduct]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        VStack {
            
            captionView
            
            ScrollView {
                
                VStack {
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 180),
                                                 spacing: 2)],
                              spacing: 12) {
                        
                        ForEach(items) { item in
                            BestSellerCardView(item: item)
                        }
                    }
                }
            }
        }
    }
    
    private var captionView: some View {
        HStack {
            bestSellerText
            
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
    
    
    private var bestSellerText: some View {
        Text("Best Seller")
            .foregroundColor(NeuStyle.palette2)
            .customFont(.title)
    }
}

struct BestSellerView_Previews: PreviewProvider {
    static var previews: some View {
        BestSellerView(items: .constant(BestSellerProduct.dummyProducts()))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray)
    }
}
