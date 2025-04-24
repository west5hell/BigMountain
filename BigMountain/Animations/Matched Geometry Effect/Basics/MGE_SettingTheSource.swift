//
//  MGE_SettingTheSource.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/4/25.
//

import SwiftUI

struct MGE_SettingTheSource: View {
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "MatchedGeometryEffect",
                subtitle: "Setting the Source",
                desc: "Why didn't the blue shape move to the yellow shape? If both views are different sizes, which size is used? The view that is the 'source' is used for matching.",
                back: .green,
                textColor: .black
            )
            
            Text("Yellow is now 'source'")
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.yellow.opacity(0.4))
                    .matchedGeometryEffect(id: "id", in: namespace, isSource: true)
                RoundedRectangle(cornerRadius: 20)
                    .fill(.blue.opacity(0.4))
                    .matchedGeometryEffect(id: "id", in: namespace, isSource: false)
            }
        }
        .font(.title)
    }
}

#Preview {
    MGE_SettingTheSource()
}
