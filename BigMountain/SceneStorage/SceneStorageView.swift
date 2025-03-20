//
//  SceneStorageView.swift
//  BigMountain
//
//  Created by Pongt Chia on 20/3/25.
//

import SwiftUI

struct SavingData_SceneStorage: View {
    @State private var textInput = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HeaderView(
                    "",
                    subtitle: "Introduction",
                    desc: "Use @SceneStorage to save data for just one screen that will persist for the lifetime of the app.",
                    back: .pink
                )
                
                NavigationLink("Enter New Data", destination: SavingData_DataEntry())
            }
            .font(.title)
            .navigationTitle("@SceneStorage")
        }
    }
}

struct SavingData_DataEntry: View {
    @SceneStorage("textInput") var textInput = ""
    @State var stateText = ""
    
    var body: some View {
        VStack(spacing: 20) {
            DescView(
                "Enter data in here and the navigate away. It will be saved to the variable using @SceneStorage.",
                back: .pink
            )
                .layoutPriority(1)
            TextEditor(text: $textInput)
                .border(Color.pink)
                .padding()
            
            DescView(
                "This data will not be saved because it's bound to a @State variable.",
                back: .pink
            )
            TextEditor(text: $stateText)
                .border(Color.pink)
                .padding()
        }
        .font(.title)
    }
}

#Preview(body: {
    SavingData_SceneStorage()
})
