//
//  Nav_WithPathAndEnum.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI

enum Screens {
    case screen1
    case screen2
    case screen3
}

struct Nav_WithPathAndEnum: View {
    @State private var navPath: [Screens] = []
    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack {
                Button("Deep Link to Screen 2") {
                    navPath.append(Screens.screen1)
                    navPath.append(Screens.screen2)
                }
                Button("Deep Link to Screen 3") {
                    navPath.append(Screens.screen1)
                    navPath.append(Screens.screen2)
                    navPath.append(Screens.screen3)
                }
            }
            .navigationDestination(for: Screens.self) { screenEnum in
                NavigationController.navigate(to: screenEnum)
            }
            .navigationTitle("Navigate with Path")
        }
        .font(.title)
    }
}

#Preview {
    Nav_WithPathAndEnum()
}

class NavigationController {
    @ViewBuilder
    static func navigate(to screen: Screens) -> some View {
        switch screen {
        case .screen1:
            Image(systemName: "1.square.fill")
                .font(.largeTitle)
                .foregroundStyle(.green)
        case .screen2:
            Image(systemName: "2.square.fill")
                .font(.largeTitle)
                .foregroundStyle(.red)
        case .screen3:
            Image(systemName: "3.square.fill")
                .font(.largeTitle)
                .foregroundStyle(.purple)
        }
    }
}
