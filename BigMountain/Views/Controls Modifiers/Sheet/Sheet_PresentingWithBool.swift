//
//  Sheet_PresentingWithBool.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct Sheet_PresentingWithBool: View {
    @State private var presentingSheet = false
    
    var body: some View {
        Button("Show modal") {
            presentingSheet = true
        }
        .font(.largeTitle)
        .sheet(isPresented: $presentingSheet) {
            ModalView(title: "Sheet", subtitle: "Presenting with Bool")
        }
    }
}

#Preview {
    Sheet_PresentingWithBool()
}

struct ModalView: View {
    @Environment(\.dismiss) var dismiss
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.largeTitle)
            Text(subtitle)
                .font(.title)
                .foregroundStyle(.gray)
            Text("By changing the State variable, you can trigger the Sheet to show")
            
            Spacer()
            Button("Dismiss") {
                dismiss()
            }
        }
        .padding()
    }
}
