//
//  CancellingMultiplePipelines.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/7/25.
//

import Combine
import SwiftUI

struct CancellingMultiplePipelines: View {
    @StateObject private var vm = CancellingMultiplePipelinesViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Group {
                HStack {
                    TextField("first name", text: $vm.firstName)
                        .textFieldStyle(.roundedBorder)
                    Text(vm.firstNameValidation)
                }
                
                HStack {
                    TextField("last name", text: $vm.lastName)
                        .textFieldStyle(.roundedBorder)
                    Text(vm.lastNameValidation)
                }
            }
            .padding()
            
            Button("Cancell All Validations") {
                vm.cancelValidations()
            }
        }
        .font(.title)
    }
}

#Preview {
    CancellingMultiplePipelines()
}

class CancellingMultiplePipelinesViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var firstNameValidation: String = ""
    @Published var lastName: String = ""
    @Published var lastNameValidation: String = ""

    private var validationCancellables: Set<AnyCancellable> = []

    init() {
        $firstName
            .map { $0.isEmpty ? "❌" : "✅" }
            .sink { [unowned self] value in
                self.firstNameValidation = value
            }
            .store(in: &validationCancellables)

        $lastName
            .map { $0.isEmpty ? "❌" : "✅" }
            .sink { [unowned self] value in
                self.lastNameValidation = value
            }
            .store(in: &validationCancellables)
    }
    
    func cancelValidations() {
        validationCancellables.removeAll()
    }
}
