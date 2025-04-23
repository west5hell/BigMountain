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
            
            TitleView()
            
            WelcomeBackView()
        }
        .font(.title)
        .foregroundStyle(Color("Foreground4"))
    }
}

#Preview {
    Curve_Exercise()
}
