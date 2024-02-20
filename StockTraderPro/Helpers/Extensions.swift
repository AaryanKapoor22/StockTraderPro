//
//  Extensions.swift
//  StockTraderPro
//
//  Created by Aaryan Kapoor on 2/14/24.
//


import UIKit
import SwiftUI

extension Color{
    public static var lightGreen: Color{
        return Color(UIColor(red: 30/255, green: 204/255, blue: 151/255, alpha: 1.0))
    }
}

let states = ["Alabama", "Washington", "California"]
extension Array where Element == CGFloat{
    var normalizedValues : [CGFloat] {
        if let min = self.min(), let max = self.max(){
            return self.map({($0 - min) / (max-min)})
        }
        
        return []
    }
}
