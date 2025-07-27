//
//  JustPublisher.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/7/25.
//

import Combine
import SwiftUI

struct JustPublisher: View {
    @StateObject private var vm = JustViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("This week's winner:")
            Text(vm.data)
                .bold()
            
            Form {
                Section {
                    List(vm.dataToView, id: \.self) { item in
                        Text(item)
                    }
                } header: {
                    Text("Contest Participants")
                        .padding()
                }
            }
        }
        .font(.title)
        .onAppear {
            vm.fetch()
        }
    }
}

#Preview {
    JustPublisher()
}

class JustViewModel: ObservableObject {
    @Published var data = ""
    @Published var dataToView: [String] = []

    func fetch() {
        let dataIn = ["Julian", "Meredith", "Luan", "Daniel", "Marina"]

        _ = dataIn.publisher
            .sink(receiveValue: { [unowned self] item in
                dataToView.append(item)
            })

        if dataIn.count > 0 {
            Just(dataIn[0])
                .map { item in
                    item.uppercased()
                }
                .assign(to: &$data)
        }
    }
}
