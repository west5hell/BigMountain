//
//  Toolbar_OnSheet.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/3/25.
//

import SwiftUI

struct Toolbar_OnSheet: View {
    @State private var presentingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            presentingSheet = true
        }
        .font(.title)
        .sheet(isPresented: $presentingSheet) {
            ConfirmationView()
        }
    }
}

#Preview {
    Toolbar_OnSheet()
}

struct ConfirmationView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .padding(.top)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Confirm") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .destructiveAction) {
                    Button("Delete") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
