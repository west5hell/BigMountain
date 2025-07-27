//
//  FailPublisher.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/7/25.
//

import Combine
import SwiftUI

struct FailPublisher: View {
    @StateObject private var vm = FailPublisherViewModel()
    @State private var age = ""

    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter Age", text: $age)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .padding()

            Button("Save") {
                vm.save(age: Int(age) ?? -1)
            }

            Text("\(vm.age)")
        }
        .font(.title)
        .alert(item: $vm.error) { error in
            Alert(title: Text("Invalid Age"), message: Text(error.rawValue))
        }
    }
}

#Preview {
    FailPublisher()
}

class Validators {
    static func validAgePublisher(age: Int) -> AnyPublisher<
        Int, InvalidAgeError
    > {
        if age < 0 {
            return Fail(error: InvalidAgeError.lessThanZero)
                .eraseToAnyPublisher()
        } else if age > 100 {
            return Fail(error: InvalidAgeError.moreThanOneHundred)
                .eraseToAnyPublisher()
        }

        return Just(age)
            .setFailureType(to: InvalidAgeError.self)
            .eraseToAnyPublisher()
    }
}

class FailPublisherViewModel: ObservableObject {
    @Published var age = 0
    @Published var error: InvalidAgeError?

    func save(age: Int) {
        _ = Validators.validAgePublisher(age: age)
            .sink(
                receiveCompletion: { [unowned self] completion in
                    if case .failure(let failure) = completion {
                        self.error = failure
                    }
                },
                receiveValue: { [unowned self] age in
                    self.age = age
                }
            )
    }

}

enum InvalidAgeError: String, Error, Identifiable {
    var id: String { rawValue }
    case lessThanZero = "Cannot be less than zero"
    case moreThanOneHundred = "Cannot be more than 100"
}
