//
//  StockCeil.swift
//  StockTraderPro
//
//  Created by Aaryan Kapoor on 2/14/24.
//

import SwiftUI

struct StockCeil: View {
    let stock: String
    let description: String
    var body: some View {
        HStack{
            Text(stock).font(.title3).bold().foregroundColor(Color.white)
            Spacer(minLength: 0)
            Text(description).foregroundColor(Color.gray)
        }.padding().background(Color.black)
    }
}

#Preview {
    StockCeil(stock: "AAPL", description: "Apple Inc")
}
