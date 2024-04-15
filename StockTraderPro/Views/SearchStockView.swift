//
//  SearchStockView.swift
//  StockTraderPro
//
//  Created by Aaryan Kapoor on 2/14/24.
//

import SwiftUI

struct SearchStockView: View {
    //let stockModel: StockModel
    @State private var symbol: String = ""
    var body: some View {
        VStack{
            TextField("Stock Ticker Symbol", text: $symbol).padding().background(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color.blue, lineWidth: 1)).padding().textInputAutocapitalization(.never)
            Divider()
            
            StockCeil(stock: "AAPL", description: "Apple Inc")
            Divider()
            StockCeil(stock: "NVDA", description: "NVIDIA Corp.")
            Divider()
            StockCeil(stock: "TSLA", description: "Tesla Inc")
            Divider()
            StockCeil(stock: "NFLX", description: "Netflix")
            //StockCeil(stock: "\(symbol)", description: stockModel.description ?? "No results found!")
            Divider()
            Spacer()
        }
    }
}

