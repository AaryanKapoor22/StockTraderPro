//
//  StocksViewModel.swift
//  StockTraderPro
//
//  Created by Aaryan Kapoor on 3/20/24.
//

import Foundation
import SwiftUI

class StocksViewModel: ObservableObject {
    //Hardcoded tickers
    @Published var tickers: [String] = ["AAPL", "NVDA", "NFLX"]
    @Published var stocks: [StockModel] = []
    @Published var searchResults: [StockTicker] = []

    init() {
        fetchStockData()
    }

    func fetchStockData() {
        DispatchQueue.main.async {
            self.stocks.removeAll()
        }
        for ticker in tickers {
            fetchAndAppendStockData(for: ticker)
        }
    }

    func searchTicker(symbol: String) {
        APIRequest.instance.getTickerLookup(searchQuery: symbol) { [weak self] returnedLookup in
            DispatchQueue.main.async {
                self?.searchResults = returnedLookup?.result ?? []
            }
        }
    }

    func addTickerFromSearch(_ stockTicker: StockTicker) {
        if !tickers.contains(stockTicker.symbol) {
            tickers.append(stockTicker.symbol)
            fetchAndAppendStockData(for: stockTicker.symbol)
        }
    }

    private func fetchAndAppendStockData(for ticker: String) {
        APIRequest.instance.getTickerLookup(searchQuery: ticker) { [weak self] returnedLookup in
            let description = returnedLookup?.result.first?.description ?? "No description"
            
            APIRequest.instance.getTicker(symbol: ticker) { returnedQuote in
                APIRequest.instance.getCandles(symbol: ticker, hourLength: 12) { returnedCandles in
                    let candleArray: [CGFloat] = returnedCandles?.c.map { CGFloat($0) } ?? []
                    
                    let newStock = StockModel(
                        symbol: ticker,
                        description: description,
                        currentPrice: returnedQuote?.c,
                        percentageChange: returnedQuote?.dp,
                        candles: candleArray
                    )
                    
                    DispatchQueue.main.async {
                        self?.stocks.append(newStock)
                    }
                }
            }
        }
    }
}
