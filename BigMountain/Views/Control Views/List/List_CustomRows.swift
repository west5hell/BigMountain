//
//  List_CustomRows.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI

struct CustomRow: View {
    var content: String
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
            Text(content)
            Spacer()
        }
        .foregroundStyle(content == "Custom Rows!" ? Color.green : Color.primary)
        .font(.title)
        .padding([.top, .bottom])
    }
}

struct List_CustomRows: View {
    var data = ["Custom Rows!", "Evans", "Lemuel James Guerrero", "Mark", "Durtschi", "Chase", "Adam", "Rodrigo"]
    
    var body: some View {
        List(data, id: \.self) { datum in
            CustomRow(content: datum)
        }
    }
}


#Preview(body: {
    List_CustomRows()
})
