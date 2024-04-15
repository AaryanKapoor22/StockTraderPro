//
//  StockView.swift
//  StockTraderPro
//
//  Created by Aaryan Kapoor on 2/14/24.
//

import SwiftUI

struct StockView: View {
    let stockModel: StockModel
    @State private var logoStr: String = ""
    var body: some View {
        VStack{
            HStack{
                //AsyncImage(url: URL(string:"https://logo.clearbit.com/\(logoStr).com")).aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).frame(width:100, height:20)
                AsyncImage(url: URL(string:"https://logo.clearbit.com/\(logoStr).com")) { image in
                    image.resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 50)
                } placeholder: {
                    ProgressView()
                }
                .cornerRadius(10)

                

               
                VStack{
                    Text(stockModel.symbol).bold().font(.title3)
                    Text(stockModel.description ?? "").foregroundColor(.gray).truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                }
                Spacer()
                Text((((stockModel.percentageChange ?? 0.0) >= 0.0) ? "+" : "")   +
                    "\(String(format: "%.2f", stockModel.percentageChange ?? 0.0))").foregroundColor((stockModel.percentageChange ?? 0.0) >= 0.0 ? Color.lightGreen : Color.red).bold().font(.headline)
                
            }
            Spacer()
            
            HStack{
                Text("$\(String(format: "%.2f", stockModel.currentPrice ?? 0.0))").bold().font(.title)
                Spacer()
                LineGraph(data: StockMockData.apple.normalizedValues).stroke((stockModel.percentageChange ?? 0.0) >= 0.0 ? Color.lightGreen : Color.red, lineWidth: 1)
                //LineGraph(data: stockModel.candles.normalizedValues).stroke(Color.lightGreen, lineWidth: 1) once the graph is fixed implement
            }
            
        }.padding(.horizontal)
            .padding(.vertical)
            .padding(5)
            .frame(height: UIScreen.main.bounds.height / 4)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 30).stroke(Color.gray))
            .onAppear{
                if let logoStr = stockModel.description?.components(separatedBy: " ").first{
                    //finds the first word of the description
                    self.logoStr = logoStr.lowercased()
                }
            }
    }
}

