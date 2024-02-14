//
//  ContentView.swift
//  StockTraderPro
//
//  Created by Aaryan Kapoor on 2/14/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView().padding()
            PortfolioView()
            
            //watchlist code -->
            VStack{
                HStack{
                    Text("Watchlist").font(.title).bold().foregroundColor(.black).padding()
                    Spacer()
                }
            }
            
            //Stock Views
            
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
                    Text("$200").foregroundColor(.black).bold().font(.title3)
                }.padding()
                
            }
            
        
            Spacer()
            
            
        }
    }
}

#Preview {
    ContentView()
}
