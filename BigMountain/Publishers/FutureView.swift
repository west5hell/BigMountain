//
//  FutureView.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/7/25.
//

import Combine
import SwiftUI

struct FutureView: View {
    @StateObject private var vm = FutureViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Button("Say Hello") {
                vm.sayHello()
            }

            Text(vm.hello)
                .padding(.bottom)

            Button("Say Goodbye") {
                vm.sayGoodbye()
            }

            Text(vm.goodbye)

        }
        .font(.title)
    }
}

#Preview {
    FutureView()
}

class FutureViewModel: ObservableObject {
    @Published var hello = ""
    @Published var goodbye = ""

    var goodbyeCancellable: AnyCancellable?

    func sayHello() {
        Future<String, Never> { promise in
            promise(Result.success("Hello, World!"))
        }
        .assign(to: &$hello)
    }

    func sayGoodbye() {
        let futurePublisher = Future<String, Never> { promise in
            Task {
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                promise(.success("Goodbye, my friend 👋"))
            }
        }

        goodbyeCancellable =
            futurePublisher
            .sink(receiveValue: { [unowned self] message in
                goodbye = message
            })
    }
}
