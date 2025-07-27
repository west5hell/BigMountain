//
//  LongRunningProcessViewModel.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/7/25.
//

import Combine
import SwiftUI

class LongRunningProcessViewModel: ObservableObject {
    @Published var data = "Start Data"
    @Published var status = ""
    private var cancellablePipeline: AnyCancellable?

    init() {
        cancellablePipeline = $data.map { [unowned self] value -> String in
            status = "Processing..."
            return value
        }
        .delay(for: 5, scheduler: RunLoop.main)
        .sink { [unowned self] value in
            status = "Finished Process"
        }
    }

    func refreshData() {
        data = "Refreshed Data"
    }

    func cancel() {
        status = "Cancelled"
        cancellablePipeline?.cancel()
        //        cancellablePipeline = nil
    }
}

struct LongRunningProcess: View {
    @StateObject private var vm = LongRunningProcessViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text(vm.data)

            Button("Refresh Data") {
                vm.refreshData()
            }

            Button("Cancel Subscription") {
                vm.cancel()
            }
            .opacity(vm.status == "Processing..." ? 1 : 0)

            Text(vm.status)
        }
        .font(.title)
    }
}

#Preview {
    LongRunningProcess()
}
