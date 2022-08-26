//
//  BasketProductsResponse.swift
//  ECommerce
//
//  Created by bovsheva on 24.08.2022.
//

import Foundation


struct BasketProductsResponse: Codable {
    let basket: [BasketProduct]
    let delivery: String
    let id: String
    let total: Int
}
