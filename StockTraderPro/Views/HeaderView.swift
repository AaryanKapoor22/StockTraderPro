//
//  HeaderView.swift
//  StockTraderPro
//
//  Created by Aaryan Kapoor on 2/14/24.
//

import SwiftUI

struct HeaderView: View {
    @Binding var showSearch: Bool
    var body: some View {
        HStack{
            Text("StockTraderPro").font(.largeTitle).bold().foregroundColor(Color.red)
            Spacer()
            
            Button(action: {
                print("tapped search")
                showSearch.toggle()
            }){
                Image(systemName: "magnifyingglass.circle.fill").accentColor(Color.red).font(.system(size: 40))
            
            }
        }
    }
}

//#Preview {
//    HeaderView()
//        .padding()
//}
