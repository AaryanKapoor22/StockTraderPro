//
//  StockView.swift
//  StockTraderPro
//
//  Created by Aaryan Kapoor on 2/14/24.
//

import SwiftUI

struct StockView: View {
    var body: some View {
        VStack{
            HStack{
                //AsyncImage(url: URL(string:"https://logo.clearbit.com/apple.com")).aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).frame(width:100, height:20)
                Image(systemName: "appletv.fill").resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 50)
                VStack{
                    Text("AAPL").bold().font(.title3)
                    Text("Apple Inc").foregroundColor(.gray).truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                }
                Spacer()
                Text("15.2%").foregroundColor(.lightGreen).bold().font(.headline)
                
            }
            Spacer()
            
            HStack{
                Text("$137.5").bold().font(.title)
                Spacer()
                LineGraph(data: StockMockData.apple.normalizedValues).stroke(Color.lightGreen, lineWidth: 1)
            }
            
        }.padding(.horizontal)
            .padding(.vertical)
            .padding(5)
            .frame(height: UIScreen.main.bounds.height / 4)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 30).stroke(Color.gray))
    }
}

#Preview {
    StockView()
}
