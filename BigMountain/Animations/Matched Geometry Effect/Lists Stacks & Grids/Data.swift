//
//  Data.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/4/25.
//

import SwiftUI

class Data {
    static func getCurrencies() -> [Item] {
        return [
            Item(name: "Dollar", systemName: "dollarsign.ring.dashed"),
            Item(name: "Euro", systemName: "eurosign.ring.dashed"),
            Item(name: "Yen", systemName: "yensign.ring.dashed"),
            Item(name: "Bitcoin", systemName: "bitcoinsign.ring.dashed"),
            Item(name: "Sterling", systemName: "sterlingsign.ring.dashed"),
            Item(name: "Chinese Yuan", systemName: "chineseyuanrenminbisign.ring.dashed"),
            Item(name: "Austral", systemName: "australsign.ring.dashed"),
            Item(name: "Cedi", systemName: "cedisign.ring.dashed"),
            Item(name: "Lira", systemName: "lirasign.ring.dashed"),
            Item(name: "Mill", systemName: "millsign.ring.dashed"),
            Item(name: "Naira", systemName: "nairasign.ring.dashed"),
            Item(name: "Norwegian Krone", systemName: "norwegiankronesign.ring.dashed"),
            Item(name: "Peruvian Soles", systemName: "peruviansolessign.ring.dashed"),
            Item(name: "Peseta", systemName: "pesetasign.ring.dashed"),
            Item(name: "Swedish Krona", systemName: "swedishkronasign.ring.dashed"),
        ]
    }
}
