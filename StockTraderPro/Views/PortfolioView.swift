//
//  PortfolioView.swift
//  StockTraderPro
//
//  Created by Aaryan Kapoor on 2/14/24.
//

import SwiftUI

struct PortfolioView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Watchlist Value").foregroundColor(Color.green).font(.title2).bold()
            HStack(alignment: .top){
                Text("$1233.50").bold().foregroundColor(.white).font(.largeTitle)
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

#Preview {
    PortfolioView()
}
