//
//  StoreProductsResponse.swift
//  ECommerce
//
//  Created by bovsheva on 24.08.2022.
//

import Foundation

struct StoreProductsResponse: Codable {
    let storeProducts: [StoreProduct]
    let bestSellerProducts: [BestSellerProduct]
    
    enum CodingKeys: String, CodingKey {
        case storeProducts = "home_store"
        case bestSellerProducts = "best_seller"
    }
}
