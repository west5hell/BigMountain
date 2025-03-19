//
//  ObservableIgnoredProperty.swift
//  BigMountain
//
//  Created by Pongt Chia on 19/3/25.
//

import SwiftUI

@Observable
class Obbservable_IgnoredPropertyOO {
    var data = ["Book 1", "Book 2", "Book 3"]
    var listName = "Book List"
    
    @ObservationIgnored var footer = "3 books"
    
    func makeViewUpdates() {
        data.append("Book \(data.count + 1)")
        footer = "\(data.count) books"
    }
    
    func makeJustFooterUpdate() {
        footer = "Read all \(data.count - 1) books!"
    }
}

struct ObservableIgnoredPropertyView: View {
    @State private var oo = Obbservable_IgnoredPropertyOO()
    
    var body: some View {
        List {
            Section {
                ForEach(oo.data, id: \.self) { datum in
                    Text(datum)
                }
            } header: {
                Text(oo.listName)
            } footer: {
                Text(oo.footer)
            }
            
            Section {
                Button("Update Data") {
                    oo.makeViewUpdates()
                }
                
                Button("Update just the Footer") {
                    oo.makeJustFooterUpdate()
                }
            }
        }
        .font(.title)
        .headerProminence(.increased)
    }
}

#Preview {
    ObservableIgnoredPropertyView()
}
