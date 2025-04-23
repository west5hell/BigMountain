//
//  Asymmetric_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/4/25.
//

import SwiftUI
import MapKit

struct Asymmetric_Intro: View {
    @State private var showHelp = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(
                    "Transitions",
                    subtitle: "Asymmetric Introduction",
                    desc: "Provide a different transition for the insertion and removal of a view."
                )
                
                ZStack(alignment: .topTrailing) {
                    Map()
                    Button {
                        showHelp = true
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
                        showHelp = false
                    }.padding(.top, 30)
                }
                .padding(35)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("DarkAccent2"))
                )
                .padding(.top, 100)
                .shadow(radius: 15)
                .transition(.asymmetric(insertion: .slide, removal: .move(edge: .bottom)))
                .zIndex(1)
            }
        }
        .animation(.spring(), value: showHelp)
        .tint(Color("Accent2"))
        .font(.title)
    }
}

#Preview {
    Asymmetric_Intro()
}
