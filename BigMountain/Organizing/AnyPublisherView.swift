//
//  AnyPublisherView.swift
//  BigMountain
//
//  Created by Pongt Chia on 28/7/25.
//

import Combine
import SwiftUI

func foo(url: URL) -> AnyPublisher<String, Never> {
    let publisher = URLSession.shared.dataTaskPublisher(for: url)
        .map { (data: Data, response: URLResponse) in
            data
        }
        .decode(type: String.self, decoder: JSONDecoder())
        .receive(on: RunLoop.main)
        .prepend("AWAY TEAM")
        .replaceError(with: "No players found")
        .eraseToAnyPublisher()

    return publisher
}

func gaz() {
    let url = URL(string: "")!

    let foo = foo(url: url)
}

class AnyPublisherViewModel: ObservableObject {
    @Published var homeTeam = true
    @Published var team: [String] = []

    private var cancellables: Set<AnyCancellable> = []

    init() {
        $homeTeam
            .sink { [unowned self] value in
                fetch(homeTeam: value)
            }
            .store(in: &cancellables)
    }

    func fetch(homeTeam: Bool) {
        team.removeAll()

    }
}

class AppPublishers {
    static func teamPublisher(homeTeam: Bool) -> AnyPublisher<String, Never> {
        if homeTeam {
            return ["Stockton", "Malone", "Williams"].publisher
                .prepend("HOME TEAM")
                .eraseToAnyPublisher()
        } else {
            let url = URL(string: "")!
            
            return URLSession.shared.dataTaskPublisher(for: url)
                .map {
                    $0.data
                }
                .decode(type: String.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .prepend("AWAY TEAM")
                .replaceError(with: "No players found")
                .eraseToAnyPublisher()
        }
    }
}
