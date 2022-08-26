//
//  BestSellerProduct.swift
//  ECommerce
//
//  Created by bovsheva on 24.08.2022.
//

import Foundation

struct BestSellerProduct: Codable, Identifiable {
    let id: Int
    var isFavorites: Bool
    let title: String
    let priceWithoutDiscount: Int
    let discountPrice: Int
    let picture: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case isFavorites = "is_favorites"
        case title
        case priceWithoutDiscount = "price_without_discount"
        case discountPrice = "discount_price"
        case picture
    }
}

extension BestSellerProduct {
    
    ///Dummy best seller products
    static func dummyProducts() -> [BestSellerProduct] {
        
        let products = [BestSellerProduct(id: 111,
                                          isFavorites: true,
                                          title: "Samsung Galaxy s20 Ultra",
                                          priceWithoutDiscount: 1047,
                                          discountPrice: 1500,
                                          picture: "https://shop.gadgetufa.ru/images/upload/52534-smartfon-samsung-galaxy-s20-ultra-12-128-chernyj_1024.jpg"),
                        BestSellerProduct(id: 222,
                                          isFavorites: true,
                                          title: "Xiaomi Mi 10 Pro",
                                          priceWithoutDiscount: 300,
                                          discountPrice: 400,
                                          picture: "https://mi92.ru/wp-content/uploads/2020/03/smartfon-xiaomi-mi-10-pro-12-256gb-global-version-starry-blue-sinij-1.jpg"),
                        BestSellerProduct(id: 33,
                                          isFavorites: true,
                                          title: "Samsung Galaxy s20 Ultra",
                                          priceWithoutDiscount: 1047,
                                          discountPrice: 1500,
                                          picture: "https://shop.gadgetufa.ru/images/upload/52534-smartfon-samsung-galaxy-s20-ultra-12-128-chernyj_1024.jpg"),
                        BestSellerProduct(id: 22,
                                          isFavorites: true,
                                          title: "Xiaomi Mi 10 Pro",
                                          priceWithoutDiscount: 300,
                                          discountPrice: 400,
                                          picture: "https://mi92.ru/wp-content/uploads/2020/03/smartfon-xiaomi-mi-10-pro-12-256gb-global-version-starry-blue-sinij-1.jpg")
        ]
        
        return products
    }
    
    ///Dummy best seller product
    static func dummyProduct() -> BestSellerProduct {
        return BestSellerProduct(id: 222,
                                 isFavorites: true,
                                 title: "Xiaomi Mi 10 Pro",
                                 priceWithoutDiscount: 300,
                                 discountPrice: 400,
                                 picture: "https://mi92.ru/wp-content/uploads/2020/03/smartfon-xiaomi-mi-10-pro-12-256gb-global-version-starry-blue-sinij-1.jpg")
    }
}
