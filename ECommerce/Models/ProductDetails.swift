//
//  ProductDetails.swift
//  ECommerce
//
//  Created by bovsheva on 24.08.2022.
//

import Foundation

struct ProductDetails: Codable {
    let cpu: String
    let camera: String
    let capacity: [String]
    let color: [String]
    let id: String
    let images: [String]
    let isFavorites: Bool
    let price: UInt
    let rating: Double
    let sd: String
    let ssd: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case cpu = "CPU"
        case camera
        case capacity
        case color
        case id
        case images
        case isFavorites
        case price
        case rating
        case sd
        case ssd
        case title
    }
}

extension StoreProduct {
    
    ///Dummy store products
    static func dummyStoreProducts() -> [StoreProduct] {
        
        let products = [StoreProduct(id: 1,
                                     isNew: true,
                                     title: "Iphone 12",
                                     subtitle: "Súper. Mega. Rápido.",
                                     picture: "https://img.ibxk.com.br/2020/09/23/23104013057475.jpg?w=1120&h=420&mode=crop&scale=both",
                                     isBuy: true),
                        StoreProduct(id: 2,
                                     isNew: nil,
                                     title: "Samsung Galaxy A71",
                                     subtitle: "Súper. Mega. Rápido.",
                                     picture: "https://cdn-2.tstatic.net/kupang/foto/bank/images/pre-order-samsung-galaxy-a71-laris-manis-inilah-rekomendasi-ponsel-harga-rp-6-jutaan.jpg",
                                     isBuy: true)
        ]
        
        return products
    }
    
    ///Dummy store product
    static func dummyStoreProduct() -> StoreProduct {
        return StoreProduct(id: 1,
                            isNew: true,
                            title: "Iphone 12",
                            subtitle: "Súper. Mega. Rápido.",
                            picture: "https://img.ibxk.com.br/2020/09/23/23104013057475.jpg?w=1120&h=420&mode=crop&scale=both",
                            isBuy: true)
    }
}
