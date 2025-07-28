//
//  SequenceView.swift
//  BigMountain
//
//  Created by Pongt Chia on 28/7/25.
//

import Combine
import SwiftUI

struct SequenceView: View {
    @StateObject private var vm = SequenceViewModel()

    var body: some View {
        VStack(spacing: 20) {
            List(vm.dataToView, id: \.self) { datum in
                Text(datum)
            }
        }
        .font(.title)
        .onAppear {
            vm.fetch()
        }
    }
}

#Preview {
    SequenceView()
}

class SequenceViewModel: ObservableObject {
    @Published var dataToView: [String] = []
    var cancellables: Set<AnyCancellable> = []

    func fetch() {
        var dataIn = [
            "Paul", "Lem", "Scott", "Chris", "Kaya", "Mark", "Adam", "Jared",
        ]

        dataIn.publisher
            .sink { completion in
                print(completion)
            } receiveValue: { [unowned self] datum in
                self.dataToView.append(datum)
                print(datum)
            }
            .store(in: &cancellables)

        dataIn.append(contentsOf: ["Rod", "Sean", "Karin"])
    }
}
