//
//  MGE_List_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/4/25.
//

import SwiftUI

struct MGE_List_Intro: View {
    @Namespace var namespace
    
    @State private var selectedCurrency: Item?
    
    private var items = Data.getCurrencies()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "List",
                desc: "There are a few things you need to do to get matchedGeometryEffect working in Lists.",
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
                        .font(.title)
                    
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
        .blur(radius: selectedCurrency != nil ? 3 : 0)
        .overlay {
            Group {
                if selectedCurrency != nil {
                    VStack(spacing: 40) {
                        Image(systemName: selectedCurrency!.systemName)
                            .symbolRenderingMode(.palette)
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
    }
}

#Preview {
    MGE_List_Intro()
}
