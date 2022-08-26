//
//  ECommerceApp.swift
//  ECommerce
//
//  Created by bovsheva on 24.08.2022.
//

import SwiftUI

@main
struct ECommerceApp: App {
    
    @StateObject var stateManager = StateManager()
    @StateObject var homeViewModel = HomeViewModel(manager: StoreManager())
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(stateManager)
                .environmentObject(homeViewModel)
        }
    }
}
