//
//  OnSubmit_Scope.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/3/25.
//

import SwiftUI

struct OnSubmit_SubmitScope: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var continueOnboarding = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HeaderView(
                    "",
                    subtitle: "Submit Scope",
                    desc: "Use submitScope modifier to prevent onSubmit.",
                    back: .blue,
                    textColor: .white
                )
                
                GroupBox("About You") {
                    TextField("first name", text: $firstName)
                        .submitScope()
                    
                    TextField("last name", text: $lastName)
                        .submitLabel(.continue)
                }
                .textFieldStyle(.roundedBorder)
                .onSubmit(of: .text) {
                    continueOnboarding = true
                }
                .navigationDestination(isPresented: $continueOnboarding) {
                    Text("Next Step")
                }
            }
            .font(.title)
        }
    }
}

#Preview {
    OnSubmit_SubmitScope()
}
