//
//  StoreKit_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 31/3/25.
//

import SwiftUI
import StoreKit

struct StoreKit_Intro: View {
    @State private var showApp = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "StoreKit",
                subtitle: "Introduction",
                desc: "You can recommend other apps in the App Store by using the StoreKit within SwiftUI."
            )
            
            Button("See This App!") {
                showApp.toggle()
            }
        }
        .font(.title)
        .appStoreOverlay(isPresented: $showApp) {
            SKOverlay.AppConfiguration(appIdentifier: "1482454543", position: .bottom)
        }
    }
}

#Preview {
    StoreKit_Intro()
}
