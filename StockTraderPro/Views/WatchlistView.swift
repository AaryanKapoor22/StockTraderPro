//
//  WatchlistView.swift
//  StockTraderPro
//
//  Created by Aaryan Kapoor on 2/14/24.
//

import SwiftUI

struct WatchlistView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Watchlist").font(.title).bold().foregroundColor(.black)
                Spacer()
                
            }
            ScrollView{
                VStack{
                    StockView()
                    StockView()
                    StockView()
                }
                
            }.padding(3)
            
        }
    }
}

#Preview {
    WatchlistView()
}
