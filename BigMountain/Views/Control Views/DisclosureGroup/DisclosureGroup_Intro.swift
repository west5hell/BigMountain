//
//  DisclosureGroup_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI

struct DisclosureGroup_Intro: View {
    @State private var disclosureExpanded = true
    @State private var sunExpanded = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "DisclosureGroup",
                subtitle: "Introduction",
                desc: "Use the DisclosureGroup when you want to expand or collapse other views."
            )
            
            VStack(spacing: 20) {
                DisclosureGroup("More Info") {
                    Text("Tap the row to expand/collapse the conent of the DisclosureGroup. DisclosureGroup are collapsed by default.")
                }
                
                DisclosureGroup {
                    Image(systemName: "info.circle.fill")
                        .foregroundStyle(.orange)
                    Text("You can use another initializer to customize your label too.")
                } label: {
                    Text("More Info")
                        .bold()
                }
                
                DisclosureGroup("Color", isExpanded: $disclosureExpanded) {
                    Text("If you want to expand a DisclosureGroup programmatically you can bind a property to the isExpanded parameter.")
                        .font(.title2)
                        .padding()
                }
                .tint(.orange)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.orange)
                        .opacity(0.1)
                )
                
                DisclosureGroup(isExpanded: $sunExpanded) {
                    HStack(spacing: 40) {
                        Image(systemName: "sunrise.fill")
                        Image(systemName: "sun.min.fill")
                        Image(systemName: "sun.max.fill")
                        Image(systemName: "sunset.fill")
                    }
                    .padding(24)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.orange)
                            .opacity(0.1)
                    )
                } label: {
                    HStack(spacing: 20) {
                        Image(systemName: "sun.max")
                        Text("Sun")
                    }
                }
                .padding(.horizontal)

            }
            .padding(.horizontal)
            
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    DisclosureGroup_Intro()
}
