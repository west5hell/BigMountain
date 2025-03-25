//
//  Table_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/3/25.
//

import SwiftUI

struct ColorInfo: Identifiable {
    let id = UUID()
    var name = ""
    var desc = Color.clear
}

struct Table_Intro: View {
    @State private var colors = [
        ColorInfo(name: "Red", desc: Color.red),
        ColorInfo(name: "Blue", desc: Color.blue),
        ColorInfo(name: "Purple", desc: Color.purple)
    ]
    
    var body: some View {
        Table(colors) {
            TableColumn("Names") { color in
                Text(color.name)
            }
            //  iOS cant see below column, but iPad can
            TableColumn("Colors") { color in
                color.desc
            }
        }
        .font(.title)
    }
}

#Preview {
    Table_Intro()
}
