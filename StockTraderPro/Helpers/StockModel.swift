//
//  StockModel.swift
//  StockTraderPro
//
//  Created by Aaryan Kapoor on 3/20/24.
//

import Foundation
struct StockModel: Hashable {
    let symbol: String // AAPL
    let description: String? // Apple Inc
    let currentPrice: Double? // 150.20
    let percentageChange: Double?
    let candles: [CGFloat]
}
