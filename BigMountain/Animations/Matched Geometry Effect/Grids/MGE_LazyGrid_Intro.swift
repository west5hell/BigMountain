//
//  MGE_LazyGrid_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/4/25.
//

import SwiftUI

struct MGE_LazyGrid_Intro: View {
    @Namespace var namespace
    @State private var selectedCurrency: Item?
    let currencies = Data.getCurrencies()
    
    var body: some View {
        VStack(spacing: 10) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "LazyVGrid",
                desc: "Here is an example of using the LazyVGrid.",
                back: .green,
            )
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(currencies) { currency in
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.green)
                            
                            if currency.id != selectedCurrency?.id {
                                Button {
                                    withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
                                        selectedCurrency = currency
                                    }
                                } label: {
                                    Image(systemName: currency.systemName)
                                        .font(.largeTitle)
                                        .matchedGeometryEffect(id: currency.id, in: namespace)
                                        .frame(width: 70, height: 56)
                                }
                            }
                        }
                        .frame(height: 100)
                    }
                }
                .padding(.horizontal, 8)
            }
        }
        .font(.title)
        .blur(radius: selectedCurrency != nil ? 3 : 0)
        .disabled(selectedCurrency != nil)
        .overlay {
            CurrencyDetailView(namespace: namespace, selectedCurrency: $selectedCurrency)
        }
    }
}

#Preview {
    MGE_LazyGrid_Intro()
}
