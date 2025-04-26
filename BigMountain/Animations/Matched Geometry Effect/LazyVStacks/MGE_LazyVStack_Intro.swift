//
//  MGE_LazyVStack_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/4/25.
//

import SwiftUI

struct MGE_LazyVStack_Intro: View {
    @Namespace var namespace
    
    @State private var selectedCurrency: Item?
    
    private var items = Data.getCurrencies()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "LazyVStack",
                desc: "Here is an example of using the LazyVStack.",
                back: .green,
            )
            
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(items) { item in
                        HStack {
                            if item.id != selectedCurrency?.id {
                                Image(systemName: item.systemName)
                                    .font(.largeTitle)
                                    .matchedGeometryEffect(id: item.id, in: namespace)
                                    .frame(width: 50, height: 36)
                            } else {
                                Color.clear
                                    .frame(width: 50, height: 36)
                            }
                            
                            Text(item.name)
                            
                            Spacer()
                        }
                        .padding()
                        .onTapGesture {
                            withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
                                selectedCurrency = item
                            }
                        }
                    }
                }
            }
            .disabled(selectedCurrency != nil)
        }
        .font(.title)
        .blur(radius: selectedCurrency != nil ? 3 : 0)
        .overlay {
            CurrencyDetailView(namespace: namespace, selectedCurrency: $selectedCurrency)
        }
    }
}

#Preview {
    MGE_LazyVStack_Intro()
}
