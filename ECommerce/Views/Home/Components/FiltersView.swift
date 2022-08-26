//
//  FiltersView.swift
//  ECommerce
//
//  Created by bovsheva on 26.08.2022.
//

import SwiftUI

struct FiltersView: View {
    
    @Binding var show: Bool
    
    var dropdownOffset: CGFloat = 50
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                Spacer()
                
                VStack(alignment: .leading) {
                    
                    CaptionView(show: $show)
                    
                    ScrollView {
                        
                        VStack {
                            
                            brendSelector
                                .zIndex(3)
                            
                            priceSelector
                                .zIndex(2)
                            
                            sizeSelector
                                .zIndex(1)
                        }
                        .padding(.top, 25)
                    }
                }
                .padding(.top, 25)
                .frame(height: 375)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: NeuStyle.shadowColor,
                        radius: 20,
                        x: 0,
                        y: -5)
            }
        }
        .ignoresSafeArea()
    }
    
    var priceSelector: some View {
        
        Group {
            
            Text("Price")
                .foregroundColor(NeuStyle.palette2)
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            DropdownSelector(
                placeholder: "$300 - $400",
                options: FiltersView.prices,
                onOptionSelected: { option in
                    print(option)
                })
                .padding(.horizontal)
            
        }
    }
    
    var brendSelector: some View {
        Group {
            Text("Brend")
                .foregroundColor(NeuStyle.palette2)
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            DropdownSelector(
                placeholder: "Samsung",
                options: FiltersView.brends,
                onOptionSelected: { option in
                    print(option)
                })
                .padding(.horizontal)
                .onTapGesture {
                    
                }
        }
    }
    
    var sizeSelector: some View {
        Group {
            Text("Size")
                .foregroundColor(NeuStyle.palette2)
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            DropdownSelector(
                placeholder: "4.5 - 5.5",
                options: FiltersView.sizes,
                onOptionSelected: { option in
                    print(option)
                })
                .padding(.horizontal)
        }
    }
}


struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView(show: .constant(true))
    }
}

extension FiltersView {
    static var uniqueKey: String {
        UUID().uuidString
    }
    
    static let brends: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "Sumsung"),
        DropdownOption(key: uniqueKey, value: "Apple"),
        DropdownOption(key: uniqueKey, value: "Xiomy")
    ]
    
    static let sizes: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "4.5 to 5.5 inches"),
        DropdownOption(key: uniqueKey, value: "5.5 to 6.5 inches"),
        DropdownOption(key: uniqueKey, value: "6.5 to 7.5 inches")
    ]
    
    static let prices: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "$300 - $500"),
        DropdownOption(key: uniqueKey, value: "$500 - $700"),
        DropdownOption(key: uniqueKey, value: "$700 - $900")
    ]
}

struct CaptionView: View {
    
    @Binding var show: Bool
    
    var body: some View {
        
        HStack {
            
            exitButton
                .padding(.leading, 44)
            
            Spacer()
            
            Text("Filter options")
                .customFont(.headline2)
                .foregroundColor(NeuStyle.palette2)
            
            Spacer()
            
            doneButton
                .padding(.trailing, 20)
        }
        .frame(maxWidth: .infinity)
    }
    
    var doneButton: some View {
        
        Button {
            self.show = false
        } label: {
            Text("Done")
                .customFont(.headline2)
                .frame(width: 86, height: 37)
        }
        .frame(width: 86, height: 37)
        .buttonStyle(NeuStyle.PrimaryButtonStyle(cornerRadius: 10))
    }
    
    var exitButton: some View {
        Button {
            self.show = false
        } label: {
            Image(systemName: "xmark")
        }
        .buttonStyle(
            NeuStyle.IconPrimaryButtonStyle(color: NeuStyle.palette2)
        )
    }
}
