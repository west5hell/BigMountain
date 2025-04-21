//
//  Interactive_Comparison.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct Interactive_Comparison: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                center: .center,
                startRadius: 10,
                endRadius: 400
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(
                    "Interactive Spring",
                    subtitle: "Comparison",
                    desc: "Here is a comparison between the spring and interactiveSpring animations"
                )
                
                Button("Change") {
                    change.toggle()
                }
                
                HStack(alignment: .top, spacing: 50) {
                    VStack {
                        Text("Spring")
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 100, height: change ? 400 : 100)
                            .animation(.spring(), value: change)
                    }
                    VStack {
                        Text("interactiveSpring")
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 100, height: change ? 400 : 100)
                            .animation(.interactiveSpring(), value: change)
                    }
                }
                .foregroundStyle(.white)
                Spacer()
            }
        }
        .font(.title)
    }
}

#Preview {
    Interactive_Comparison()
}
