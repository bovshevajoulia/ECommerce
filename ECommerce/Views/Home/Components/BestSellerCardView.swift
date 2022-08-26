//
//  BestSellerCardView.swift
//  ECommerce
//
//  Created by bovsheva on 25.08.2022.
//

import SwiftUI

struct BestSellerCardView: View {
    
    var item: BestSellerProduct
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            VStack {
                
                ProductRemoteImageView(urlString: item.picture)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 177)
                    .frame(maxWidth: .infinity)
                    .offset(y: -5)
                
                VStack {
                    HStack {
                        Text("$ \(item.discountPrice)")
                           .customFont(.body2)
                           .foregroundColor(NeuStyle.palette2)
                        
                        Text("$ \(item.priceWithoutDiscount)")
                            .customFont(.headline3)
                            .foregroundColor(NeuStyle.palette4)
                            .padding(.horizontal, 7)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("\(item.title)")
                        .foregroundColor(NeuStyle.palette2)
                        .customFont(.caption3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 21)
            }
            .foregroundColor(Color.white)
            .frame(width: 181, height: 227)
            .background(.white)
            .shadow(color: NeuStyle.shadowColor, radius: 40)
            .cornerRadius(10)
            
            Button {
                
            } label: {
                Image(systemName: item.isFavorites ? "heart.fill" : "heart")
                    .foregroundColor(NeuStyle.palette1)
                    .font(.system(size: 11))
            }
            .buttonStyle(NeuStyle.CirclePrimaryButtonStyle(color: NeuStyle.palette3, size: 25)
            )
            .padding(12)
        }
    }
}


struct BestSellerCardView_Previews: PreviewProvider {
    static var previews: some View {
        BestSellerCardView(item: BestSellerProduct.dummyProduct())
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity)
            .background(NeuStyle.background)
    }
}
