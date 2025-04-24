//
//  MGE_Source_DifferentIds.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/4/25.
//

import SwiftUI

struct MGE_Source_DifferentIds: View {
    @Namespace var namespace
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "2 Sources - Different IDs",
                desc: "You CAN have two sources inside the same namespace as long as they have different IDs.",
                back: .green,
                textColor: .black
            )
            
            HStack {
                if change == false {
                    RoundedRectangle(cornerRadius: 16).fill(Color.blue)
                        .matchedGeometryEffect(id: "id", in: namespace)
                        .frame(width: 60, height: 60)
                        .onTapGesture {
                            change.toggle()
                        }
                } else {
                    RoundedRectangle(cornerRadius: 16).fill(Color.green)
                        .matchedGeometryEffect(id: "id", in: namespace)
                        .onTapGesture {
                            change.toggle()
                        }
                }
            }
            HStack {
                if change {
                    RoundedRectangle(cornerRadius: 16).fill(Color.red)
                        .matchedGeometryEffect(id: "id2", in: namespace)
                        .frame(width: 60, height: 60)
                } else {
                    RoundedRectangle(cornerRadius: 16).fill(Color.orange)
                        .matchedGeometryEffect(id: "id2", in: namespace)
                }
            }
        }
        .animation(.spring(), value: change)
        .font(.title)
    }
}

#Preview {
    MGE_Source_DifferentIds()
}
