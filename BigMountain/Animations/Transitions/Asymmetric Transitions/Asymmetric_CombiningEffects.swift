//
//  Asymmetric_CombiningEffects.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/4/25.
//

import SwiftUI
import MapKit

struct Asymmetric_CombiningEffects: View {
    @State private var showHelp = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(
                    "Transitions",
                    subtitle: "Asymmetric: Combining Effects",
                    desc: "When using the asymmetric function you can still combine effects"
                )
                
                ZStack(alignment: .topTrailing) {
                    Map()
                    Button {
                        withAnimation(.spring()) {
                            showHelp = true
                        }
                    } label: {
                        Image(systemName: "questionmark.circle.fill")
                    }.padding()
                }.ignoresSafeArea(edges: .vertical)
            }
            
            if showHelp {
                VStack(spacing: 20) {
                    Text("Help")
                        .foregroundStyle(Color("LightShade2"))
                    Image("Phone")
                    Button("Close") {
                        withAnimation(.easeIn) {
                            showHelp = false
                        }
                    }.padding(.top, 30)
                }
                .padding(35)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("DarkAccent2"))
                )
                .padding(.top, 100)
                .shadow(radius: 15)
                .transition(
                    .asymmetric(
                        insertion: 
                                .scale(scale: 0.1, anchor: .topTrailing)
                                .combined(with: .offset(y: 120)),
                        removal: 
                                .scale(scale: 0.2)
                                .combined(with: .opacity)
                    )
                )
                .zIndex(1)
            }
        }
        .tint(Color("Accent2"))
        .font(.title)
    }
}

#Preview {
    Asymmetric_CombiningEffects()
}
