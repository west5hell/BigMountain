//
//  PassthroughSubjectView.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/7/25.
//

import Combine
import SwiftUI

struct PassthroughSubjectView: View {
    @StateObject private var vm = PassthroughSubjectViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                TextField("credit card number", text: $vm.creditCard)
                Group {
                    switch vm.status {
                    case .ok:
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.green)
                    case .invalid:
                        Image(systemName: "x.circle.fill")
                            .foregroundStyle(.red)
                    default:
                        EmptyView()
                    }
                }
            }
            .padding()
            
            Button("Verify CC Number") {
                vm.verifyCreditCard.send(vm.creditCard)
            }
        }
        .font(.title)
    }
}

#Preview {
    PassthroughSubjectView()
}

class PassthroughSubjectViewModel: ObservableObject {
    @Published var creditCard = ""
    @Published var status = CreditCardStatus.notEvaluated
    let verifyCreditCard = PassthroughSubject<String, Never>()
    
    init() {
        verifyCreditCard
            .map { creditCard -> CreditCardStatus in
                if creditCard.count == 16 {
                    return CreditCardStatus.ok
                } else {
                    return CreditCardStatus.invalid
                }
            }
            .assign(to: &$status)
    }
}

enum CreditCardStatus {
    case notEvaluated
    case ok
    case invalid
}
