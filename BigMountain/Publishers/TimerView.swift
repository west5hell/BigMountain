//
//  TimerView.swift
//  BigMountain
//
//  Created by Pongt Chia on 28/7/25.
//

import Combine
import SwiftUI

struct TimerView: View {
    @StateObject private var vm = TimerViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Adjust Interval")
            Slider(
                value: $vm.interval,
                in: 0.1...1,
                minimumValueLabel: Image(systemName: "hare"),
                maximumValueLabel: Image(systemName: "tortoise")
            ) {
                Text("Interval")
            }
            .padding(.horizontal)
            
            List(vm.data, id: \.self) { datum in
                Text(datum)
                    .font(.system(.title, design: .monospaced))
            }
        }
        .font(.title)
        .onAppear {
            vm.start()
        }
    }
}

#Preview {
    TimerView()
}

class TimerViewModel: ObservableObject {
    @Published var data: [String] = []
    @Published var interval: Double = 1

    private var timerCancellable: AnyCancellable?
    private var intervalCancellable: AnyCancellable?

    let timeFormatter = DateFormatter()

    init() {
        timeFormatter.dateFormat = "HH:mm:ss.SSS"

        intervalCancellable =
            $interval
            .dropFirst()
            .sink(receiveValue: { [unowned self] interval in
                timerCancellable?.cancel()
                data.removeAll()
                start()
            })
    }

    func start() {
        timerCancellable =
            Timer
            .publish(every: interval, on: .main, in: .common)
            .autoconnect()
            .sink(receiveValue: { [unowned self] datum in
                data.append(timeFormatter.string(from: datum))
            })
    }
}
