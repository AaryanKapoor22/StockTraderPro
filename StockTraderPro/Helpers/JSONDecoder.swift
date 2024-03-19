//
//  JSONDecoder.swift
//  StockTraderPro
//
//  Created by Aaryan Kapoor on 2/14/24.
//

import Foundation


struct Ticker: Decodable {
    let c: Double
    let d: Double
    let dp: Double
    let h: Double
    let l: Double
    let o: Double
    let pc: Double
    let t: Double
}

struct StockSymbolSearch: Decodable {
    let result: [StockTicker]
}

struct StockTicker: Decodable, Hashable {
    let description: String
    let displaySymbol: String
    let symbol: String
    let type: String
}
struct Candles: Decodable {
    let c:[Double]
}
