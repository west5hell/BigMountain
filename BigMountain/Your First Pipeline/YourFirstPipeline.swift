//
//  YourFirstPipeline.swift
//  BigMountain
//
//  Created by Pongt Chia on 31/5/25.
//

import Combine
import SwiftUI

class YourFirstPipelineViewModel: ObservableObject {
    @Published var name = ""
    @Published var validation = ""

    init() {
        $name
            .map { $0.isEmpty ? "❌" : "✅" }
            .assign(to: &$validation)
    }
}

struct YourFirstPipeline: View {
    @StateObject private var vm = YourFirstPipelineViewModel()

    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "First Pipeline",
                subtitle: "Introduction",
                desc:
                    "This is a simple pipeline you can create in Combine to validate a text field."
            )
            HStack {
                TextField("name", text: $vm.name)
                    .textFieldStyle(.roundedBorder)
                Text(vm.validation)
            }
            .padding()
        }
        .font(.title)
    }
}
