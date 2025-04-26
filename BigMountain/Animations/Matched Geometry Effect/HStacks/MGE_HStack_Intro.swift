//
//  MGE_HStack_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/4/25.
//

import SwiftUI

struct MGE_HStack_Intro: View {
    @Namespace var namespace
    @State private var selectedCurrency: Item?
    let currencies = Data.getCurrencies()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "HStack",
                desc: "Although the HStack will clip its child views, you can minimize the effect by speeding up the animation.",
                back: .green,
            )
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(currencies) { currency in
                        CurrencyColumnView(
                            namespace: namespace,
                            selectedCurrency: $selectedCurrency,
                            currency: currency
                        )
                    }
                }
            }
            .frame(height: 200)
            Spacer()
            
            DescView(
                "The clipping becomes barely noticeable anymore.",
                back: .green
            )
        }
        .font(.title)
        .overlay {
            Group {
                if let selectedCurrency {
                    MGECurrencyDetailFullView(
                        namespace: namespace,
                        selectedCurrency: $selectedCurrency,
                        currency: selectedCurrency
                    )
                }
            }
        }
    }
}

#Preview {
    MGE_HStack_Intro()
}

struct CurrencyColumnView: View {
    var namespace: Namespace.ID
    @Binding var selectedCurrency: Item?
    var currency: Item
    
    var body: some View {
        ZStack {
            if currency.id != selectedCurrency?.id {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.green)
                    .matchedGeometryEffect(id: currency.id, in: namespace)
                
                VStack {
                    Spacer(minLength: 0)
                    Image(systemName: currency.systemName)
                        .resizable()
                        .scaledToFit()
                        .matchedGeometryEffect(id: currency.systemName, in: namespace)
                        .padding()
                    Spacer()
                    Text(currency.name)
                        .font(.title)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .matchedGeometryEffect(
                            id: currency.name + "title",
                            in: namespace,
                            properties: .position
                        )
                }
                .padding()
            }
        }
        .frame(width: 150)
        .onTapGesture {
            withAnimation {
                selectedCurrency = currency
            }
        }
    }
}
