//
//  MGE_VStack_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/4/25.
//

import SwiftUI

struct MGE_VStack_Intro: View {
    @Namespace var namespace
    @State private var selectedCurrency: Item?
    let currencies = Data.getCurrencies()
    
    var body: some View {
        ScrollView {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "VStack",
                desc: "For this example, I'm using a ScrollView for the entire view so we don't get a clipping of the image going out of the parent container.",
                back: .green,
            )
            
            ForEach(currencies) { currency in
                CurrencyRowView(namespace: namespace, selectedCurrency: $selectedCurrency, currency: currency)
            }
        }
        .overlay {
            Group {
                if let selectedCurrency {
                    MGECurrencyDetailFullView(namespace: namespace, selectedCurrency: $selectedCurrency, currency: selectedCurrency)
                }
            }
        }
    }
}

#Preview {
    MGE_VStack_Intro()
}

struct CurrencyRowView: View {
    var namespace: Namespace.ID
    @Binding var selectedCurrency: Item?
    var currency: Item
    
    var body: some View {
        ZStack {
            if currency.id != selectedCurrency?.id {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.green)
                    .padding(.horizontal)
                    .matchedGeometryEffect(id: currency.id, in: namespace)
                
                HStack {
                    Image(systemName: currency.systemName)
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .matchedGeometryEffect(id: currency.systemName, in: namespace)
                        .frame(width: 175, height: 175)
                        .padding(.leading)
                    
                    Text(currency.name)
                        .font(.title)
                        .matchedGeometryEffect(
                            id: currency.name+"title",
                            in: namespace,
                            properties: .position
                        )
                    Spacer()
                }
            } else {
                Color.clear
                    .frame(height: 175)
            }
        }
        .onTapGesture {
            withAnimation {
                selectedCurrency = currency
            }
        }
    }
}

struct MGECurrencyDetailFullView: View {
    var namespace: Namespace.ID
    @Binding var selectedCurrency: Item?
    var currency: Item
    @State private var show = false
    @State private var delayTime = 0.5
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
//                .matchedGeometryEffect(id: currency.id, in: namespace)
            
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: currency.systemName)
                        .resizable()
                        .scaledToFit()
                        .matchedGeometryEffect(id: currency.id, in: namespace)
                        .shadow(radius: 5)
                        .padding(40)
                        .background {
                            Circle()
                                .fill(.white)
                                .opacity(show ? 1 : 0)
                                .scaleEffect(show ? 1 : 0.2)
                                .animation(.spring(dampingFraction: 0.6).delay(delayTime), value: show)
                        }
                        .frame(width: 180, height: 170)
                    
                    Text(currency.name)
                        .font(.title).bold()
                        .foregroundStyle(.black)
                        .matchedGeometryEffect(id: currency.name+"title", in: namespace, properties: .position)
                    
                    Spacer()
                }
                
                Spacer()
                
                Group {
                    Text("Details about the \(currency.name).")
                    Button {
                        withAnimation {
                            selectedCurrency = nil
                        }
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                    }
                }
                .opacity(show ? 1 : 0)
                .animation(.easeInOut.delay(delayTime), value: show)
            }
            .font(.title)
            .padding(.top)
            .onAppear {
                show.toggle()
            }
        }
    }
}
