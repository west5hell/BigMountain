//
//  Redacted_Unredacted.swift
//  BigMountain
//
//  Created by Pongt Chia on 31/3/25.
//

import SwiftUI

struct Redacted_Unredacted: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Redacted",
                subtitle: "Using Unredacted",
                desc: "You can also un-redact text that's been redacted."
            )
            
            VStack(spacing: 20) {
                Text("Redact this")
                Text("Redact this")
                Text("Redact this too")
                Text("Don't redact this")
                    .unredacted()
                Text("Redact this")
            }
            .redacted(reason: .placeholder)
        }
        .font(.title)
    }
}

#Preview {
    Redacted_Unredacted()
}
