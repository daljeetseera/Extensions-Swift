//
//  UIcolorHelper.swift
//  
//
//  Created by Daljeet Singh on 30/08/19.
//

import UIKit

extension UIColor {
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    convenience init(rating : Float) {
        var colorUint : UInt = 0x5ba829
        if rating <= 1 { colorUint = 0xcb202d }
        else if rating <= 2 { colorUint = 0xff7800 }
        else if rating <= 3 { colorUint = 0xffba00 }
        else if rating <= 4 { colorUint = 0x9acd32 }
        else { colorUint = 0x5ba829 }
        self.init(rgb: colorUint)
    }
    
    func disable() -> UIColor {
        return self.withAlphaComponent(0.7)
    }
}
