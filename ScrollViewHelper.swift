//
//  ScrollViewHelper.swift
//  
//
//  Created by Daljeet Singh on 30/08/19.
//

import UIKit

extension UIScrollView {
    
    func scrollToPosition(x : CGFloat?, y: CGFloat?, animated: Bool = true) {
        
        let contentOffset = CGPoint(x: x ?? self.contentOffset.x, y: y ?? self.contentOffset.y)
        self.setContentOffset(contentOffset, animated: animated)
    }
}
