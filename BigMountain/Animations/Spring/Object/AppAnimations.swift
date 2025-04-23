//
//  AppAnimations.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

class AppAnimations {
    static var tightSpring = Spring(response: 0.2, dampingRatio: 0.6)
    static var heavySpring = Spring(mass: 1.0, stiffness: 8, damping: 0.4)
    static var looseSpring = Spring(settlingDuration: 0.8, dampingRatio: 0.6)
    
    static var customCurve = UnitCurve.bezier(
        startControlPoint: UnitPoint(x: 0.5, y: -0.5),
        endControlPoint: UnitPoint(x: 0.5, y: 1.5)
    )
}
