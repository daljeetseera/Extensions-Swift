//
//  UIButtonHelper.swift
//  
//
//  Created by Daljeet Singh on 30/08/19.
//

import UIKit

extension UIButton {
    
    func showLoadingAnimation() {
        UIView.animate(withDuration: 0.33, animations: {
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion: {(success) in
            UIView.animate(withDuration: 0.15, animations: {
                self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }, completion: {(success) in
                UIView.animate(withDuration: 0.25, animations: {
                    self.transform = CGAffineTransform(scaleX: 1, y: 1)
                }, completion: nil)
            })
        })
    }
    
    func alignTextBelow(spacing: CGFloat = 2.0) {
        if let image = self.imageView?.image {
            let imageSize: CGSize = image.size
            self.titleEdgeInsets = UIEdgeInsets.init(top: spacing, left: -imageSize.width, bottom: -(imageSize.height), right: 0.0)
            let labelString = NSString(string: self.titleLabel!.text!)
            let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: self.titleLabel!.font])
            self.imageEdgeInsets = UIEdgeInsets.init(top: -(titleSize.height + spacing), left: 0.0, bottom: 0.0, right: -titleSize.width)
        }
    }
}
