//
//  Sheet_PresentationBackground.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct Sheet_PresentationBackground: View {
    @State private var showSheet = false
    
    var body: some View {
        ZStack {
            Image("")
                .resizable()
                .ignoresSafeArea()
            
            Button("Show Sheet") {
                showSheet.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .sheet(isPresented: $showSheet) {
            VStack(spacing: 16) {
                Text("You can add different styles to the sheet, such as this material. The corner radius can also be customized now.")
                .multilineTextAlignment(.center)
            }
            .padding()
            .presentationDetents([.medium, .large])
            .presentationBackground(.thinMaterial)
            .presentationCornerRadius(80)
        }
        .font(.title)
    }
}

#Preview {
    Sheet_PresentationBackground()
}
