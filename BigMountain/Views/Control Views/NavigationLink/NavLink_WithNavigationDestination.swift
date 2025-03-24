//
//  NavLink_WithNavigationDestination.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI

struct NavLink_WithNavigationDestination: View {
    @State private var showSheet = false
    @State private var navigate = false
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(value: "NavigationLink 1") {
                    Text("Navigate with String")
                }
                NavigationLink(value: true) {
                    Text("Navigate with Bool")
                }
                
                Button("Show Sheet") {
                    showSheet.toggle()
                }
            }
            .navigationDestination(for: String.self) { stringValue in
                Text("Value is: ") + Text("\(stringValue)").bold()
            }
            .navigationDestination(for: Bool.self, destination: { boolValue in
                Text("Value is: ") + Text("\(boolValue)").bold()
            })
            .navigationTitle("Navigation Destination")
            .sheet(isPresented: $showSheet) {
                VStack(spacing: 20) {
                    NavigationLink(destination: Text("Destination from Link")) {
                        Text("Navigation Link")
                    }
                    Button("Button Link") {
                        showSheet = false
                        navigate = true
                    }
                }
                .presentationDetents([.height(240)])
            }
            .navigationDestination(isPresented: $navigate) {
                Text("Destination from Button")
            }
        }
        .font(.title)
    }
}


#Preview {
    NavLink_WithNavigationDestination()
}
