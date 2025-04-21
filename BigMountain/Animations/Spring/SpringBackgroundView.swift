//
//  SpringBackgroundView.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct SpringBackgroundView: View {
    var body: some View {
        RadialGradient(
            gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
            center: .center,
            startRadius: 10,
            endRadius: 400
        )
        .ignoresSafeArea()
    }
}

#Preview {
    SpringBackgroundView()
}
