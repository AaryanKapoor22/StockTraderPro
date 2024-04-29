//
//  SearchStockView.swift
//  StockTraderPro
//
//  Created by Aaryan Kapoor on 2/14/24.
//

import SwiftUI

struct SearchStockView: View {
    @State private var symbol: String = ""
    @ObservedObject var stocksViewModel: StocksViewModel

    var body: some View {
        VStack {
            TextField("Stock Ticker Symbol", text: $symbol, onCommit: {
                stocksViewModel.searchTicker(symbol: symbol)
            })
            .padding()
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
            .stroke(Color.blue, lineWidth: 1))
            .padding()
            .textInputAutocapitalization(.never)

            List(stocksViewModel.searchResults, id: \.symbol) { stockTicker in
                Button(action: {
                    stocksViewModel.addTickerFromSearch(stockTicker)
                }) {
                    HStack {
                        Text(stockTicker.symbol)
                        Spacer()
                        Text(stockTicker.description)
                    }
                }
            }
        }
    }
}



