//
//  BookListView.swift
//  BigMountain
//
//  Created by Pongt Chia on 17/3/25.
//

import SwiftUI

struct BookListView: View {
    @State var oo = BooksOO()
    
    var body: some View {
        List(oo.data) { datum in
            Text(datum.name)
        }
        .font(.title)
        .onAppear {
            oo.fetch()
        }
    }
}

#Preview {
    BookListView(oo: MockBookListOO())
}
