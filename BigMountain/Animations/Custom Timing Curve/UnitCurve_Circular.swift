//
//  UnitCurve_Circular.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/4/25.
//

import SwiftUI

struct UnitCurve_Circular: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            Group {
                Circle()
                    .overlay {
                        Text("easeIn")
                            .foregroundStyle(.white)
                    }
                    .animation(
                        .timingCurve(UnitCurve.easeIn, duration: 0.5),
                        value: change
                    )
                Circle()
                    .overlay {
                        Text("˚ easeIn")
                            .foregroundStyle(.white)
                    }
                    .animation(
                        .timingCurve(UnitCurve.circularEaseIn, duration: 0.5),
                        value: change
                    )
                Circle()
                    .overlay {
                        Text("easeOut")
                            .foregroundStyle(.white)
                    }
                    .animation(
                        .timingCurve(UnitCurve.easeOut, duration: 0.5),
                        value: change
                    )
                Circle()
                    .overlay {
                        Text("˚ easeOut")
                            .foregroundStyle(.white)
                    }
                    .animation(
                        .timingCurve(UnitCurve.circularEaseOut, duration: 0.5),
                        value: change
                    )
                Circle()
                    .overlay {
                        Text("easeInOut")
                            .foregroundStyle(.white)
                    }
                    .animation(
                        .timingCurve(UnitCurve.easeInOut, duration: 0.5),
                        value: change
                    )
                Circle()
                    .overlay {
                        Text("˚ easeInOut")
                            .foregroundStyle(.white)
                    }
                    .animation(
                        .timingCurve(UnitCurve.circularEaseInOut, duration: 0.5),
                        value: change
                    )
            }
            .foregroundStyle(.gold)
            .frame(height: 100)
            .frame(maxWidth: .infinity, alignment: change ? .trailing : .leading)
            
            Button("Change") {
                change.toggle()
            }
            .buttonStyle(.borderedProminent)
            .font(.title)
        }
    }
}

#Preview {
    UnitCurve_Circular()
}
