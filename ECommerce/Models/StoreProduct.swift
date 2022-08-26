//
//  StoreProduct.swift
//  ECommerce
//
//  Created by bovsheva on 24.08.2022.
//

import Foundation

struct StoreProduct: Codable {
    let id: Int
    let isNew: Bool?
    let title: String
    let subtitle: String
    let picture: String
    let isBuy: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case isNew = "is_new"
        case title
        case subtitle
        case picture
        case isBuy = "is_buy"
    }
}

extension StoreProduct {
    
    ///Dummy store products
    static func dummyProducts() -> [StoreProduct] {
        
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
    static func dummyProduct() -> StoreProduct {
        return StoreProduct(id: 1,
                            isNew: true,
                            title: "Iphone 12",
                            subtitle: "Súper. Mega. Rápido.",
                            picture: "https://img.ibxk.com.br/2020/09/23/23104013057475.jpg?w=1120&h=420&mode=crop&scale=both",
                            isBuy: true)
    }
}
