//
//  ContentView.swift
//  StockTraderPro
//
//  Created by Aaryan Kapoor on 2/14/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingSearch: Bool = false
    var body: some View {
        VStack {
            HeaderView(showSearch: $isShowingSearch).padding()
            PortfolioView()
            WatchlistView()
            Spacer()
            
        }.edgesIgnoringSafeArea(.bottom)
            .sheet(isPresented: $isShowingSearch){
                SearchStockView()
            }.onAppear{
                //APIRequest.instance.getCandles(symbol: "AAPL", hourLength: 8)
                APIRequest.instance.getTicker(symbol: "AAPL") { returnedTicker in
                    print(returnedTicker)
                    
                }
                APIRequest.instance.getTickerLookup(searchQuery: "Apple") { returnedLookup in
                    print(returnedLookup)
                    
                }
                //candles not working
                APIRequest.instance.getCandles(symbol: "AAPL", hourLength: 8){ returnedCandles in
                    print(returnedCandles)
                    
                }
            }
    }
}

#Preview {
    ContentView()
}
