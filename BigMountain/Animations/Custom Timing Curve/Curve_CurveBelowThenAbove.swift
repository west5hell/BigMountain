//
//  Curve_CurveBelowThenAbove.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/4/25.
//

import SwiftUI

struct Curve_CurveBelowThenAbove: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color("Background3")
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                HeaderView(
                    "Custom Timing Curve",
                    subtitle: "Curve Below & Above",
                    desc: "The view will BACKUP and then go BEYOND its destination."
                )
                
                Spacer()
                
                HStack {
                    HStack(spacing: 16) {
                        Button {
                            
                        } label: {
                            Image(systemName: "wand.and.rays.inverse")
                        }

                        Button {
                            
                        } label: {
                            Image(systemName: "dial.fill")
                        }

                        Button {
                            
                        } label: {
                            Image(systemName: "paintbrush.fill")
                        }

                        Button {
                            
                        } label: {
                            Image(systemName: "bandage.fill")
                        }

                        Button {
                            show.toggle()
                        } label: {
                            Image(systemName: "line.horizontal.3.decrease")
                        }
                        .rotationEffect(.degrees(-90))
                        .offset(x: 10)
                    }
                    .font(.largeTitle)
                    .padding()
                    .padding(.leading, 60)
                    .background(Capsule().fill(Color("Secondary3")))
                    .offset(x: show ? -60 : -320)
                    .animation(.timingCurve(0.5, -0.5, 0.5, 1.5, duration: 0.8), value: show)
                    
                    Spacer()
                }
                
                Spacer()
            }
            .font(.title)
            .tint(Color("Accent3"))
        }
    }
}

#Preview {
    Curve_CurveBelowThenAbove()
}
