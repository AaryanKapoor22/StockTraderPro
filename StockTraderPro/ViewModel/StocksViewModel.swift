//
//  StocksViewModel.swift
//  StockTraderPro
//
//  Created by Aaryan Kapoor on 3/20/24.
//

import Foundation
import SwiftUI

//Keeping this for now
class StocksViewModel: ObservableObject {
    
    var tickers = ["AAPL", "NVDA", "NFLX","TSLA","MSFT"]
    
    @Published var stocks: [StockModel] = [StockModel]()
    
    
    init() {
        self.fetchStockData()
    }
    
    
    public func fetchStockData() {
        
        for ticker in tickers {
            
            APIRequest.instance.getTickerLookup(searchQuery: ticker) { returnedLookup in
                APIRequest.instance.getTicker(symbol: ticker) { returnedQuote in
                    APIRequest.instance.getCandles(symbol: ticker, hourLength: 12) { returnedCandles in
                        
                        let candleArray: [CGFloat] = returnedCandles?.c.map {CGFloat($0)} ?? []
                        
                        let stockInfo = returnedLookup?.result[0]
                        
                        let newStock = StockModel(symbol: ticker, description: stockInfo?.description, currentPrice: returnedQuote?.c, percentageChange: returnedQuote?.dp, candles: candleArray)
                        
                        
                        DispatchQueue.main.async {
                            self.stocks.append(newStock)
                        }
                        
                        
                    }
                }
            }
            
            
        }
        
    }
    
}
