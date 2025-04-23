//
//  MGE_MatchingGeometries.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/4/25.
//

import SwiftUI

struct MGE_MatchingGeometries: View {
    @Namespace var namespace    // Your views have to share the same namespace.
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "Matching Geometries",
                desc: "The matchedGeometryEffect will give two views the same size ane position."
            )
            
            Text("Normal")
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.yellow.opacity(0.4))
                RoundedRectangle(cornerRadius: 20)
                    .fill(.blue.opacity(0.4))
            }
            
            Text("Matched Geometries")
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.yellow.opacity(0.4))
                    .matchedGeometryEffect(id: "id", in: namespace)
                RoundedRectangle(cornerRadius: 20)
                    .fill(.blue.opacity(0.4))
                    .matchedGeometryEffect(id: "id", in: namespace)
            }
        }
        .font(.title)
    }
}

#Preview {
    MGE_MatchingGeometries()
}
