//
//  BookRowView.swift
//  BigMountain
//
//  Created by Pongt Chia on 19/3/25.
//

import SwiftUI

struct BookRowView: View {
    let bookName: String
    
    var body: some View {
        GroupBox {
            VStack {
                Image(systemName: "book.pages")
                Text(bookName)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .listRowSeparator(.hidden)
    }
}

#Preview {
    BookRowView(bookName: "A bravo new world")
        .padding()
}
