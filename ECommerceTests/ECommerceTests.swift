//
//  ECommerceTests.swift
//  ECommerceTests
//
//  Created by bovsheva on 24.08.2022.
//

import XCTest
import Combine
@testable import ECommerce

class ECommerceTests: XCTestCase {
    
    /// Set of an 'AnyCancellable' to store all subscriptions
    private var subscriptions = Set<AnyCancellable>()
    
    /// Because we have test STATIC MOCK REST API server with static data we can check the GET request and decoding data
    func test_get_basket_products__from_server_succeess() throws {
        let promise = expectation(description: "basket products")
        
        let manager = StoreManager(network: NetworkService())
        manager.basketProducts()
            .sink { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("test_get_basket_products__from_server_succeess: error \(error)")
                        XCTFail()
                }
        } receiveValue: { basketProductsResponse in
            print(basketProductsResponse)
            promise.fulfill()
        }
        .store(in: &subscriptions)
        
        wait(for: [promise], timeout: 3)
    }
    
    func test_get_store_products_from_server_succeess() throws {
        let promise = expectation(description: "store products")
        
        let manager = StoreManager(network: NetworkService())
        manager.storeProducts()
            .sink { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("test_get_store_products_from_server_succeess: error \(error)")
                        XCTFail()
                }
        } receiveValue: { storeProductsResponse in
            print(storeProductsResponse)
            promise.fulfill()
        }
        .store(in: &subscriptions)
        
        wait(for: [promise], timeout: 3)
    }
    
    func test_get_product_details_from_server_succeess() throws {
        let promise = expectation(description: "product details")
        
        let manager = StoreManager(network: NetworkService())
        manager.productDetails()
            .sink { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("test_get_product_details_from_server_succeess: error \(error)")
                        XCTFail()
                }
        } receiveValue: { productDetails in
            print(productDetails)
            promise.fulfill()
        }
        .store(in: &subscriptions)
        
        wait(for: [promise], timeout: 3)
    }
}
