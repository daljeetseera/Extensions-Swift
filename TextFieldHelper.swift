//
//  TextFieldHelper.swift
//  
//
//  Created by Daljeet Singh on 30/08/19.
//

import UIKit

extension UITextField {
    
    func setLeftPadding(paddingValue:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: paddingValue, height: self.frame.size.height))
        self.leftViewMode = .always
        self.leftView = paddingView
    }
    
    func highlight() {
        UIView.animate(withDuration: 0.15, animations: { () -> Void in
            self.backgroundColor = AppColor.validationErrorColor
        }, completion: { (finished) -> Void in
            // ....
            UIView.animate(withDuration: 0.15, delay: 1.0, options: .curveEaseOut, animations: {() -> Void in
                self.backgroundColor = AppColor.invisibleLightColor
            }, completion: nil)
        })
    }
    
}
