//
//  PortfolioView.swift
//  StockTraderPro
//
//  Created by Aaryan Kapoor on 2/14/24.
//

import SwiftUI

struct PortfolioView: View {
    @StateObject var stocksVM: StocksViewModel
    var body: some View {
        VStack(alignment: .leading){
            Text("Watchlist Value").foregroundColor(Color.green).font(.title2).bold()
            HStack(alignment: .top){
                Text("\(String(format:"%.2f", stocksVM.stocks.map({$0.currentPrice ?? 0.0}).reduce(0.0,+)))").bold().foregroundColor(.white).font(.largeTitle)
                Text("4.5%").foregroundColor(Color.lightGreen).font(.title3)
            }
            Spacer()
            HStack{
                Button(action: {
                    
                }){
                    Text("Deposit").foregroundColor(.white).bold().font(.footnote).padding().padding(.horizontal).background(RoundedRectangle(cornerRadius: 100))
                }
                Spacer()
                Button(action:{
                    
                }){
                    Text("Withdraw").foregroundColor(.white).bold().font(.footnote).padding().padding(.horizontal).background(RoundedRectangle(cornerRadius: 100))
                }
            }
            .padding()
            
        }
        .padding()
        .frame(height: UIScreen.main.bounds.height / 4)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 30).fill(Color.black))
            .padding()
    }
}


