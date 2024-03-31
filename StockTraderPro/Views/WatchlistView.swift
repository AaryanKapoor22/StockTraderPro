//
//  WatchlistView.swift
//  StockTraderPro
//
//  Created by Aaryan Kapoor on 2/14/24.
//

import SwiftUI

struct WatchlistView: View {
    @StateObject var stocksVM: StocksViewModel
    var body: some View {
        VStack{
            HStack{
                Text("Watchlist").font(.title).bold().foregroundColor(.black)
                Spacer()
                
            }
            ScrollView{
                VStack{
                    ForEach(stocksVM.stocks, id: \.self ){ stock in
                        StockView(stockModel: stock)
                    }
                }
                
            }.padding(3)
            
        }
    }
}

