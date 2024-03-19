//
//  Finnhub.swift
//  StockTraderPro
//
//  Created by Aaryan Kapoor on 2/14/24.
//

import Foundation

class APIRequest{
    static let instance = APIRequest()
    
    //api variable
    private var url = "https://finnhub.io/api/v1/"
    private var key = "&token=ADDTOKENHERE"
    
    public func getTicker(symbol: String, handler: @escaping(_ returnedTicker: Ticker?) -> ()){
        let query: String = "quote?symbol=\(symbol)"
        let url = URL(string: url + query + key)
        
        if let url = url{
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error{
                    print("Error while getting quote from API: \(error)")
                    return
                }
                guard let quoteData = data else{
                    print("Ticker Search not found!")
                    return
                }
                let returnedTicker = try? JSONDecoder().decode(Ticker.self, from: quoteData)
                
                handler(returnedTicker)
                //print(returnedTicker)
            }
            task.resume()
        }
    }
    
    public func getTickerLookup(searchQuery: String, handler: @escaping (_ returnedLookup: StockSymbolSearch?) -> ()){
        let query: String = "search?q=\(searchQuery)"
        
        let url = URL(string: url + query + key)
        
        if let url = url {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error{
                    print("Error while searching for symbol: \(error)")
                    return
                }else{
                    guard let searchData = data else{
                        print("Symbol search NOT VALID!")
                        return
                    }
                    let returnedTickers = try? JSONDecoder().decode(StockSymbolSearch.self, from: searchData)
                    print(returnedTickers)
                    handler(returnedTickers)
                    
                }
            }
            task.resume()
        }
    }
    
    public func getCandles(symbol:String, hourLength: Int, handler: @escaping(_ returnedCandles: Candles?) ->()){
        let endDate = Int(Date().timeIntervalSince1970)
        let startDate = Int((Calendar.current.date(byAdding: .day, value: -(hourLength), to: Date())?.timeIntervalSince1970 ?? Date().timeIntervalSince1970))
        let query = "stock/candle?symbol=\(symbol)&resolution=5&from=\(startDate)&to=\(endDate)"
        
        let url = URL(string: url + query + key)
        
        if let url = url {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error{
                    print("Error getting candles: \(error)")
                    return
                }else{
                    guard let searchData = data else{
                        print("candle data not valid")
                        return
                    }
                    let returnedCandles = try? JSONDecoder().decode(Candles.self, from: searchData)
                    //print(returnedCandles)
                    handler(returnedCandles)
                }
            }
            task.resume()
        }
    }
}
