//
//  Form_ListRowBackground.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI

struct Form_ListRowBackground: View {
    var body: some View {
        Form {
            Section {
                Text("List Row Backgroud")
                    .foregroundStyle(.gray)
                
                Text("Forms and Lists allow you to set a background view with a function called \"listRowBackground(view:)\".")
                
                Text("You can use this modifier on just one row, like this.")
                    .listRowBackground(Color.purple)
                    .foregroundStyle(.white)
            } header: {
                Text("Form")
                    .font(.largeTitle)
            }
            
            Section {
                Text("Or you can set a view or color for a whole section.")
                
                Text("Note, the color of the section header is not affected when set on Section.")
                    .fixedSize(horizontal: false, vertical: true)
            } header: {
                Text("Whole Section")
                    .font(.title)
                    .foregroundStyle(.gray)
            }
            .foregroundStyle(.white)
            .listRowBackground(Color.purple)
        }
        .font(.title2)
    }
}

#Preview {
    Form_ListRowBackground()
}
