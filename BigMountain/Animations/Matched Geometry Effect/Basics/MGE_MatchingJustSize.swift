//
//  MGE_MatchingJustSize.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/4/25.
//

import SwiftUI

struct MGE_MatchingJustSize: View {
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "Matching Just Size",
                desc: "By default the matched geometry effect will match size and position. But you can specify to only match the size of the source view.",
                back: .green,
                textColor: .black
            )
            
            Text("The blue shapes are matching the size of the green shape:")
            
            HStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.green)
                    .frame(width: 80, height: 80)
                    .matchedGeometryEffect(id: "id", in: namespace)
                    .border(.red)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.blue)
                    .matchedGeometryEffect(id: "id", in: namespace, properties: .size, isSource: false)
                    .border(.red)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.blue)
                    .matchedGeometryEffect(id: "id", in: namespace, properties: .size, isSource: false)
                    .border(.red)
            }
        }
        .font(.title)
    }
}

#Preview {
    MGE_MatchingJustSize()
}
