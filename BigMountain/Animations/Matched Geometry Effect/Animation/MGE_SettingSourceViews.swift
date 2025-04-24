//
//  MGE_SettingSourceViews.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/4/25.
//

import SwiftUI

struct MGE_SettingSourceViews: View {
    @Namespace var namespace
    
    @State private var isSource = true
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "Setting Source Views",
                desc: "When hiding and showing views, you may want to make all views source for better transitions.",
                back: .green,
                textColor: .black
            )
            
            HStack {
                if !change {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.blue)
                        .matchedGeometryEffect(id: "id", in: namespace, isSource: isSource)
                        .frame(width: 60, height: 60)
                        .onTapGesture {
                            change.toggle()
                        }
                }
                
                Spacer()
                
                if change {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.green)
                        .matchedGeometryEffect(id: "id", in: namespace, isSource: isSource)
                        .frame(width: 160, height: 160)
                        .onTapGesture {
                            change.toggle()
                        }
                }
            }
            .frame(height: 160)
            
            Toggle("Both are source", isOn: $isSource)
                .padding(.horizontal)
        }
        .animation(.easeIn, value: change)
        .font(.title)
    }
}

#Preview {
    MGE_SettingSourceViews()
}
