//
//  List_WithChildren.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI

struct Parent: Identifiable {
    var id = UUID()
    var name = ""
    var children: [Parent]?
}

struct List_WithChildren: View {
    var parents = [Parent(name: "Mark",
                          children: [Parent(name: "Paola")]),
                   Parent(name: "Rodrigo",
                          children: [Parent(name: "Kai"), Parent(name: "Brennan"),
                                     Parent(name: "Easton")]),
                   Parent(name: "Marcella",
                          children: [Parent(name: "Sam"), Parent(name: "Melissa"),
                                     Parent(name: "Melanie")])]
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "List",
                subtitle: "Children",
                desc: "You can arrange your data to allow the List view to show it in an outline style.",
                back: .green
            )
            
            List(parents, children: \.children) { parent in
                Text("\(parent.name)")
            }
        }
        .font(.title)
    }
}

#Preview {
    List_WithChildren()
}
