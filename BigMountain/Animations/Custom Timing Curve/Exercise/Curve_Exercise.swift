//
//  Curve_Exercise.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/4/25.
//

import SwiftUI

struct Curve_Exercise: View {
    private var backgroudGradient = LinearGradient(
        gradient: Gradient(colors: [Color("Background4"), Color("Secondary4")]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    var body: some View {
        ZStack {
            backgroudGradient.ignoresSafeArea()
            
            VStack {
                Text("Workout Pro")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .padding(.top, 40)
                Spacer()
            }
            
            VStack(spacing: 20) {
                Text("Welcome Back,")
                    .fontWeight(.thin)
                    .padding(.top)
                Text("Jaqueline")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                Image("JOJO-Liu")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("See Details")
                        .fontWeight(.light)
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .foregroundStyle(.white)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("Accent4"))
                        .opacity(0.1)
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("Accent4"), lineWidth: 0.7)
                }
                .padding()
            }
            .frame(width: 300, height: 600)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color("Secondary4"))
                    .shadow(radius: 8)
            )
        }
        .font(.title)
        .foregroundStyle(Color("Foreground4"))
    }
}

#Preview {
    Curve_Exercise()
}
