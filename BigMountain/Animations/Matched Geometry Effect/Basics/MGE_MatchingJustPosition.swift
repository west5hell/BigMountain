//
//  MGE_MatchingJustPosition.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/4/25.
//

import SwiftUI

struct MGE_MatchingJustPosition: View {
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "Matching Just Position",
                desc: "When you match just the position property, all the views will stack on each other.",
                back: .green,
                textColor: .black
            )
            
            Text("The blue shapes are matching the size of the green shape:")
            
            HStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.green)
                    .frame(width: 140, height: 140)
                    .matchedGeometryEffect(
                        id: "id",
                        in: namespace,
                        properties: .position,
                        isSource: false
                    )
                    .border(.red)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.blue)
                    .frame(width: 100, height: 100)
                    .matchedGeometryEffect(id: "id", in: namespace)
                    .border(.red)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    .frame(width: 40, height: 40)
                    .matchedGeometryEffect(
                        id: "id",
                        in: namespace,
                        properties: .position,
                        isSource: false
                    )
                    .border(.red)
            }
        }
        .font(.title)
    }
}

#Preview {
    MGE_MatchingJustPosition()
}
