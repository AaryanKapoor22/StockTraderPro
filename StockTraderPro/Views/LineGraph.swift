//
//  LineGraph.swift
//  StockTraderPro
//
//  Created by Aaryan Kapoor on 2/14/24.
//

import SwiftUI

struct LineGraph: Shape {
    
    var data: [CGFloat]
    func path(in rect: CGRect) -> Path {
        func convertToPoint(index: Int) -> CGPoint{
            let point = data[index]
            
            let x = rect.width * CGFloat(index) / CGFloat(data.count)
            let y = (1 - point) * rect.height
            
            return CGPoint(x: x, y: y)
        }
        return Path{ p in
            if data.count < 2 {
                return
            }
            let start = data.first
            
            p.move(to: CGPoint(x: 0 , y: (1 - (start ?? 0.0)) * rect.height))
            
            for index in  data.indices{
                p.addLine(to: convertToPoint(index: index))
            }
        }
    }
    
    
}

#Preview {
    LineGraph(data: StockMockData.apple.normalizedValues)
        .stroke(Color.lightGreen).frame(width: 400, height: 500).padding()
}
