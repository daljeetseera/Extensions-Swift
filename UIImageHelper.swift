//
//  UIImageHelper.swift
//  
//
//  Created by Daljeet Singh on 30/08/19.
//

import UIKit

extension UIImage {
    
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    
    static func imageFrom(text: String, attributes: [NSAttributedString.Key : Any], size: CGSize) -> UIImage? {
        
        UIGraphicsBeginImageContext(size)
        let roundingBox = text.size(withAttributes: attributes)
        let rect = CGRect(x: 0, y: (size.height/2) - (roundingBox.height/2) , width: size.width, height: size.height)
        text.draw(in: rect, withAttributes: attributes)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image
}
