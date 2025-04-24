//
//  MGE_TogglingIsSource.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/4/25.
//

import SwiftUI

struct MGE_TogglingIsSource: View {
    @Namespace var namespace
    @State private var isSource = true
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "Toggling isSource",
                desc: "You can also toggle the isSource properly with a @State property.",
                back: .green,
                textColor: .black
            )
            
            Text("\(isSource ? "Yellow" : "Blue") is now 'source'")
            
            HStack {
                Text("Yellow")
                    .frame(maxWidth: .infinity)
                Text("Blue")
                    .frame(maxWidth: .infinity)
            }
            
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.yellow.opacity(0.4))
                    .matchedGeometryEffect(id: "id", in: namespace, isSource: isSource)
                RoundedRectangle(cornerRadius: 20)
                    .fill(.blue.opacity(0.4))
                    .matchedGeometryEffect(id: "id", in: namespace, isSource: !isSource)
            }
            
            Button("Toggle isSource") {
                isSource.toggle()
            }
            .padding(.bottom)
        }
        .font(.title)
    }
}

#Preview {
    MGE_TogglingIsSource()
}
