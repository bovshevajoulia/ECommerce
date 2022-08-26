//
//  MainView.swift
//  ECommerce
//
//  Created by bovsheva on 25.08.2022.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var stateManager: StateManager
    
    var body: some View {
        
            ZStack {
                switch stateManager.tabSelection {
                    
                    case 0:
                        HomeView()
                    
                    case 1:
                        
                        ZStack {
                            
                            NeuStyle.background
                                .ignoresSafeArea()
                            
                            VStack {
                                Text("Basket tab")
                            }
                        }
                        
                    case 2:
                        
                        ZStack {
                            
                            NeuStyle.background
                                .ignoresSafeArea()
                            
                            VStack {
                                Text("Favorites tab")
                            }
                        }
                    
                    case 3:
                        ZStack {
                            
                            NeuStyle.background
                                .ignoresSafeArea()
                            
                            VStack {
                                Text("Person tab")
                            }
                        }
                        
                    default:
                        VStack {
                            Text("Default screen")
                        }
                }
                
                if stateManager.isProductDetailsPresented {
                    ProductDetailsView(show: $stateManager.isProductDetailsPresented)
                }
                
                if stateManager.isFilterViewPresented {
                    FiltersView(show: $stateManager.isFilterViewPresented)
                }
            }
            .overlay(
                TabbarView(selection: $stateManager.tabSelection)
                    .opacity(stateManager.isFilterViewPresented ? 0 : 1)
            )
        }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        
        MainView()
            .environmentObject(StateManager())
    }
}
