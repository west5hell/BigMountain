//
//  Form_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI

struct Form_Intro: View {
    @State private var sectionExpanded = false
    
    var body: some View {
        Form {
            Section {
                Text("This is a Form!")
                    .font(.title)
                Text("You can put any content in here")
                Text("The cells will grow to fit the content")
                Text("Remember, it's just views inside of views")
            } header: {
                Text("Section Header Text")
            }
            .headerProminence(.increased)
            
            Section(isExpanded: $sectionExpanded) {
                Text("Limitations")
                    .font(.title)
                Text("There are built-in margins that are difficult to get around. Take a look at the color below so you can see where the margins are:")
                Color.purple
            } header: {
                HStack {
                    Image(systemName: "person.2.square.stack.fill")
                        .padding(.trailing)
                    Text("People")
                }
                .padding()
                .font(.title)
                .foregroundStyle(Color.purple)
            }
            
            Section {
                Text("Summary")
                    .font(.title)
                Text("Pretty much what you see here is what you get.")
            } footer: {
                Text("Total: $5,600.00").bold()
            }
            
            Section {
                Button("Toggle") {
                    sectionExpanded.toggle()
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

//struct SectionTextAndImage: View {
//    var body: some View {
//
//    }
//}

#Preview {
    Form_Intro()
}
