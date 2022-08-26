//
//  HotSalesCardView.swift
//  ECommerce
//
//  Created by bovsheva on 26.08.2022.
//

import SwiftUI

struct HotSalesCardView: View {
    
    let item: StoreProduct
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            NeuStyle.backgroundHotSalesCard
            
            ProductRemoteImageView(urlString: item.picture)
                .aspectRatio(contentMode: .fit)
                .offset(x: 100)
            
            VStack(alignment: .leading) {
                
                Circle()
                    .frame(width: 27, height: 27)
                    .foregroundColor(NeuStyle.palette1)
                    .overlay(
                        VStack {
                            
                            Text("New")
                                .foregroundColor(.white)
                                .font(.custom("SF Pro Display-Bold",
                                              size: 10,
                                              relativeTo: .headline)
                                )
                        }
                    ).opacity(item.isNew ?? false ? 1 : 0)
                    
                title
                
                subtitle
                
                buttonBuy
            }
            .padding(.horizontal, 25)
            .padding(.top, 14)
        }
        .frame(width: 378, height: 182)
        .cornerRadius(10)
    }
    
    var buttonBuy: some View {
        Button {
            
        } label: {
            Text("Buy now!")
                .frame(width: 98, height: 23)
                .foregroundColor(.black)
        }
        .frame(width: 98, height: 23, alignment: .leading)
        .buttonStyle(NeuStyle.PrimaryButtonStyle(background: .white,
                                                 cornerRadius: 5)
        )
    }
    
    var subtitle: some View {
        Text(item.subtitle)
            .modifier(CardHeadlineStyle())
            .foregroundColor(.white)
            .padding(.top, 5)
    }
    
    var title: some View {
        Text(item.title)
            .modifier(CardTitleStyle())
            .foregroundColor(.white)
    }
}

struct HotSalesCardView_Previews: PreviewProvider {
    static var previews: some View {
        HotSalesCardView(item: StoreProduct.dummyProduct())
    }
}
