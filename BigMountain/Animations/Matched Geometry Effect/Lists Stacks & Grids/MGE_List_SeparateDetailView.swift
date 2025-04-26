//
//  MGE_List_SeparateDetailView.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/4/25.
//

import SwiftUI

struct MGE_List_SeparateDetailView: View {
    @Namespace var namespace
    
    @State private var selectedCurrency: Item?
    
    private var items = Data.getCurrencies()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "List",
                desc: "You can extract the detail view into a separate view.",
                back: .green,
            )
            
            List(items) { item in
                HStack {
                    if item.id != selectedCurrency?.id {
                        Image(systemName: item.systemName)
                            .symbolRenderingMode(.palette)
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
            .listStyle(.plain)
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
    MGE_List_SeparateDetailView()
}

struct CurrencyDetailView: View {
    var namespace: Namespace.ID
    
    @Binding var selectedCurrency: Item?
    
    var body: some View {
        if let systemName = selectedCurrency?.systemName {
            VStack(spacing: 40) {
                Image(systemName: systemName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: selectedCurrency!.id, in: namespace)
                    .frame(width: 250)
                
                Button {
                    withAnimation(.easeInOut) {
                        selectedCurrency = nil
                    }
                } label: {
                    Text("Close")
                        .foregroundStyle(.green)
                        .padding()
                        .background {
                            Capsule()
                                .fill(.white)
                        }
                }
            }
            .padding(40)
            .background {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.green)
                    .shadow(radius: 10)
            }
        }
    }
}
