//
//  StoreManager.swift
//  ECommerce
//
//  Created by bovsheva on 24.08.2022.
//

import Foundation
import Combine

protocol StoreManagerProtocol {
    
    /// Fetch store products from the server
    /// - Returns: 'AnyPublisher' type with 'StoreProductsResponse' data and 'APIError'
    func storeProducts() -> AnyPublisher<StoreProductsResponse, APIError>
    
    /// Fetch store products from the server
    /// - Returns: 'AnyPublisher' type with 'BasketProductsResponse' data and 'APIError'
    func basketProducts() -> AnyPublisher<BasketProductsResponse, APIError>
}

///Class to manage API calls
final class StoreManager: StoreManagerProtocol {
    
    // MARK: - Private
    
    private let network: NetworkServiceProtocol
    
    /// API Endpoints
    private enum Endpoint: String {
        case store = "654bd15e-b121-49ba-a588-960956b15175"
        case basket = "53539a72-3c5f-4f30-bbb1-6ca10d42c149"
        case product = "6c14c560-15c6-4248-b9d2-b4508df7d4f5"
    }
    
    /// Constants
    private struct Constants {
        static let baseUrl = "https://run.mocky.io/v3/"
    }
    
    // MARK: - Init
    
    init(network: NetworkServiceProtocol = NetworkService()
    ) {
        self.network = network
        print("StoreManager: init")
    }
    
    /// Fetch store products from the server
    /// - Returns: 'AnyPublisher' type with 'StoreProductsResponse' data and 'APIError'
    public func storeProducts() -> AnyPublisher<StoreProductsResponse, APIError> {
        let urlString = Constants.baseUrl + Endpoint.store.rawValue
        
        return Future { [weak self] promise in
            
            self?.network.fetch(StoreProductsResponse.self,
                                url: urlString
            ) { result in
                
                switch result {
                        
                    case .failure(let error):
                        print("StoreManager: storeProducts: error: \(error.localizedDescription)")
                        promise(.failure(error))
                        
                    case .success(let response):
                        
                        promise(.success(response))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    /// Fetch order products stored in the basket from the server
    /// - Returns: 'AnyPublisher' type with 'BasketProductsResponse' data and 'APIError'
    public func basketProducts() -> AnyPublisher<BasketProductsResponse, APIError> {
        let urlString = Constants.baseUrl + Endpoint.basket.rawValue
        
        return Future { [weak self] promise in
            
            self?.network.fetch(BasketProductsResponse.self,
                                url: urlString
            ) { result in
                
                switch result {
                        
                    case .failure(let error):
                        print("StoreManager: basketProducts: error: \(error.localizedDescription)")
                        promise(.failure(error))
                        
                    case .success(let response):
                        
                        promise(.success(response))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    /// Fetch store products from the server
    /// - Returns: 'AnyPublisher' type with 'BasketProductsResponse' data and 'APIError'
    public func productDetails() -> AnyPublisher<ProductDetails, APIError> {
        
        let urlString = Constants.baseUrl + Endpoint.product.rawValue
        
        return Future { [weak self] promise in
            
            self?.network.fetch(ProductDetails.self,
                                url: urlString
            ) { result in
                
                switch result {
                        
                    case .failure(let error):
                        print("StoreManager: productDetails: error: \(error.localizedDescription)")
                        promise(.failure(error))
                        
                    case .success(let response):
                        
                        promise(.success(response))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
