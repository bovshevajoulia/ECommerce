//
//  HomeView.swift
//  ECommerce
//
//  Created by bovsheva on 25.08.2022.
//

import SwiftUI

struct HomeView: View {
    
    @State var categorySelection: Int = 0
    @State var searchString: String = ""
    
    @EnvironmentObject var stateManager: StateManager
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    let categories = ProductCategory.dummyCategories
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            NeuStyle.background
                .ignoresSafeArea()
            
            filterButton
            
            VStack {
                
                categoryCaptionView
                
                CategoriesView(categorySelection: $categorySelection)
                
                searchView
                
                HotSalesView(items: $homeViewModel.storeProducts)
                
                Spacer()
                
                BestSellerView(items: $homeViewModel.bestSellerProducts)
                    .padding(.bottom, 45)
            }
            .padding(.top, 35)
            .padding(.horizontal, 25)
        }
    }
    
    private var filterButton: some View {
        Button {
            stateManager.isFilterViewPresented = true
        } label: {
            Image("filter")
                .frame(width: 11, height: 13)
        }
        .buttonStyle(
            NeuStyle.CirclePrimaryButtonStyle(
                color: NeuStyle.background,
                size: 34)
        )
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .topTrailing)
        .padding(.trailing, 25)
    }
    
    private var searchView: some View {
        HStack {
            
            searchText
            
            Button {} label: {
                Image("square")
                    .frame(width: 14, height: 14, alignment: .center)
            }
            .buttonStyle(NeuStyle.CirclePrimaryButtonStyle(color: NeuStyle.palette1, size: 34)
            )
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 30)
    }
    
    private var categoryCaptionView: some View {
        HStack {
            categoryText
            
            Spacer()
            
            viewAllText
                .padding(.horizontal, 15)
        }
        .padding(.horizontal, 15)
    }
    
    private var searchText: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $searchString)
                .customFont(.caption)
        }
        .frame(maxWidth: .infinity)
        .modifier(NeuStyle.TextIconFieldStyle(roundedCornes: 50,
                                              background: NeuStyle.palette3,
                                              foreground: NeuStyle.palette1))
    }
    
    private var viewAllText: some View {
        Text("view all")
            .foregroundColor(NeuStyle.palette1)
            .customFont(.subheadline)
    }
    
    private var categoryText: some View {
        Text("Select Category")
            .foregroundColor(NeuStyle.palette2)
            .customFont(.title)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeView()
            .environmentObject(StateManager())
            .environmentObject(
                HomeViewModel(manager: StoreManager(network: NetworkService()),
                              forPreview: true)
            )
    }
}
