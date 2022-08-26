//
//  Category.swift
//  ECommerce
//
//  Created by bovsheva on 25.08.2022.
//

import Foundation

struct ProductCategory {
    
    let enable: String
    let disable: String
    let title: String
}

extension ProductCategory {
    
    static let dummyCategories = [
        ProductCategory(enable: "phone-enable",
                 disable: "phone-disable",
                 title: "Phone"),
        ProductCategory(enable: "books-enable",
                 disable: "books-disable",
                 title: "Books"),
        ProductCategory(enable: "health-enable",
                 disable: "health-disable",
                 title: "Health"),
        ProductCategory(enable: "phone-enable",
                 disable: "phone-disable",
                 title: "Phone"),
        ProductCategory(enable: "books-enable",
                 disable: "books-disable",
                 title: "books"),
        ProductCategory(enable: "health-enable",
                 disable: "health-disable",
                 title: "Health")
    ]
}
