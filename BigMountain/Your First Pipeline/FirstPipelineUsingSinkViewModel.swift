//
//  FirstPipelineUsingSinkViewModel.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/7/25.
//

import Combine
import Foundation
import SwiftUI

class FirstPipelineUsingSinkViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var validation: String = ""
    var cancellable: AnyCancellable?

    init() {
        cancellable =
            $name
            .map { $0.isEmpty ? "❌" : "✅" }
            .sink(receiveValue: { [unowned self] value in
                self.validation = value
            })
    }
}

struct FirstPipelineUsingSink: View {
    @StateObject private var vm = FirstPipelineUsingSinkViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "First Pipeline",
                subtitle: "With Sink",
                desc:
                    "The validation is now being assigned using the sink subscriber. This allows you to cancel the subscription any time you would like."
            )
            
            HStack {
                TextField("name", text: $vm.name)
                    .textFieldStyle(.roundedBorder)
                Text(vm.validation)
            }
            .padding()
            
            Button("Cancel Subscription") {
                vm.validation = ""
                vm.cancellable?.cancel()
            }
        }
        .font(.title)
    }
}

#Preview {
    FirstPipelineUsingSink()
}
