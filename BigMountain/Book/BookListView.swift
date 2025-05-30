//
//  BookListView.swift
//  BigMountain
//
//  Created by Pongt Chia on 30/5/25.
//

import SwiftUI

struct BookListView: View {
    @State private var vm = BookViewModel()
    
    var body: some View {
        List(vm.books) { book in
            HStack {
                Image(systemName: "book")
                Text(book.name)
            }
        }
        .onAppear {
            vm.fetch()
        }
    }
}

#Preview {
    BookListView()
}
