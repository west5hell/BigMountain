//
//  List_MoveRow.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI

struct List_MoveRow: View {
    @State var data = [
        "Hit the Edit button to reorder",
        "Practice Coding",
        "Grocery shopping",
        "Get tickets",
        "Clean house",
        "Do laundry",
        "Cook dinner",
        "Paint room"
    ]
    @State private var selection: String?
    @State private var selections = Set<String>()
    
    var body: some View {
        NavigationStack {
            List(selection: $selection) {
                ForEach(data, id: \.self) { datum in
                    Text(datum)
                        .selectionDisabled(datum ==  "Cook dinner")
                        .font(Font.system(size: 24))
                        .padding()
                }
                .onMove { source, destination in
                    data.move(fromOffsets: source, toOffset: destination)
                }
                .onDelete { offsets in
                    data.remove(atOffsets: offsets)
                }
            }
            .navigationTitle("To Do")
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
            }
        }
        .tint(.green)
    }
}

#Preview {
    List_MoveRow()
}
