//
//  HomeViewModel.swift
//  ECommerce
//
//  Created by bovsheva on 25.08.2022.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    
    @Published var storeProducts: [StoreProduct] = []
    @Published var bestSellerProducts: [BestSellerProduct] = []
    
    /// State
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    // MARK: - Private
    private let manager: StoreManagerProtocol
    
    /// Set of an 'AnyCancellable' to store all subscriptions
    private var subscriptions = Set<AnyCancellable>()
    
    private let forPreview: Bool
    
    // MARK: - init
    init(manager: StoreManagerProtocol, forPreview: Bool = false) {
        self.manager = manager
        self.forPreview = forPreview
        print("HomeViewModel: init")
        
        update()
    }
    
    public func update() {
        if forPreview == false {
            updateProducts()
        }
        else {
            storeProducts = StoreProduct.dummyProducts()
            bestSellerProducts = BestSellerProduct.dummyProducts()
        }
    }
    
    deinit {
        print("HomeViewModel: deinit")
    }
    
    private func updateProducts() {
        
        self.isLoading = true
        self.errorMessage = nil
        
        self.manager.storeProducts()
            .receive(on: RunLoop.main)
            .sink { [unowned self] completion in
                self.isLoading = false
                
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("HomeViewModel: updateProducts: error \(error)")
                        self.errorMessage = error.localizedDescription
                }
            } receiveValue: { [unowned self] products in
                self.isLoading = false
                self.storeProducts = products.storeProducts
                self.bestSellerProducts = products.bestSellerProducts
            }
            .store(in: &subscriptions)
    }
}
