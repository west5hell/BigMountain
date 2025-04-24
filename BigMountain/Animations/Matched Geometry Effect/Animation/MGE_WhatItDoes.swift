//
//  MGE_WhatItDoes.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/4/25.
//

import SwiftUI

struct MGE_WhatItDoes: View {
    @Namespace var namespace
    @State private var showView2 = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "What It Does",
                desc: "The matchedGeometryEffect is used on 2 views that are being removed and inserted. You use it to create an animated transition between the 2 views.",
                back: .green,
                textColor: .black
            )
            
            Spacer()
            
            if showView2 {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.green)
                    .overlay {
                        Text("View 2")
                    }
                    .matchedGeometryEffect(id: "change", in: namespace)
                    .onTapGesture {
                        showView2.toggle()
                    }
            } else {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.green)
                    .overlay {
                        Text("View 1")
                    }
                    .matchedGeometryEffect(id: "change", in: namespace)
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        showView2.toggle()
                    }
            }
        }
        .animation(.default, value: showView2)
        .font(.title)
    }
}

#Preview {
    MGE_WhatItDoes()
}
