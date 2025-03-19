//
//  Maintainability_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/3/25.
//

import SwiftUI

struct Maintainability_Intro: View {
    @State var oo = BooksOO()
    
    var body: some View {
        List {
            Section {
                ForEach(oo.data) { datum in
//                    rowView(datum.name)
//                        .listRowSeparator(.hidden)
                    BookRowView(bookName: datum.name)
                }
            } header: {
                sectionHeaderView
            }
        }
        .headerProminence(.increased)
        .listStyle(.plain)
        .onAppear {
            oo.fetch()
        }
    }
    
    var sectionHeaderView: some View {
        HStack {
            Label("Books (\(oo.data.count))", systemImage: "books.vertical.fill")
            Spacer()
            Button("Add", systemImage: "plus") {
                
            }
            .buttonStyle(.bordered)
        }
    }
    
    func rowView(_ bookName: String) -> some View {
        GroupBox {
            VStack {
                Image(systemName: "book.pages")
                Text(bookName   )
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    Maintainability_Intro(oo: MockBookListOO())
}
