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
    @StateObject private var immediate = FutureImmediateExecutionViewModel()
    @StateObject private var once = FutureOnceViewModel()

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
            
            Divider()
            
            Text(immediate.data)
            
            Divider()
            Text(once.firstResult)
            
            Button("Run Again") {
                once.runAgain()
            }
            
            Text(once.secondResult)

        }
        .font(.title)
        .onAppear {
            immediate.fetch()
            once.fetch()
        }
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

class FutureImmediateExecutionViewModel: ObservableObject {
    @Published var data = ""
    
    func fetch() {
        _ = Future<String, Never> { [unowned self] promise in
            data = "Hello, my friend 👋"
        }
    }
}

class FutureOnceViewModel: ObservableObject {
    @Published var firstResult = ""
    @Published var secondResult = ""
    
    let futurePublisher = Future<String, Never> { promise in
        promise(.success("Future Publisher has run! 🙌"))
        print("Future Publisher has run! 🙌")
    }
    
    func fetch() {
        futurePublisher
            .assign(to: &$firstResult)
    }
    
    func runAgain() {
        futurePublisher
            .assign(to: &$secondResult)
    }
}
