//
//  StateManager.swift
//  ECommerce
//
//  Created by bovsheva on 25.08.2022.
//

import Foundation

import Combine

/// Object to store Main module state
class StateManager: ObservableObject {
    
    @Published var tabSelection: Int = 0
    @Published var categorySelection: Int = 0
    
    /// Details full screen mode
    @Published var isProductDetailsPresented: Bool = false
    
    /// Filter overlap mode
    @Published var isFilterViewPresented: Bool = false
    
    /// Scroll detection
    @Published var hasScrolled: Bool = false
    @Published var scrollNamespace = "scroll"
    
    /// Set of an 'AnyCancellable' to store all subscriptions
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        self.setupSubscriptions()
    }
    
    // MARK: - Private
    private func setupSubscriptions() {
        
        self.$tabSelection
            .receive(on: RunLoop.main)
            .sink { [unowned self] selection in
                self.isProductDetailsPresented = false
                self.isFilterViewPresented = false
            }
            .store(in: &subscriptions)
    }
}
