//
//  ArrayHelper.swift
//  
//
//  Created by Daljeet Singh on 30/08/19.
//

import UIKit

extension Array where Element == String {
    
    func getCommaSeparatedString() -> String {
        
        var str = ""
        for value in self {
            str = str + String.init(format: "%@,", value)
        }
        if str.hasSuffix(",") {
            str = String(str.dropLast())
        }
        
        return str
    }
    
    func removeObject(_ value: String) -> [String] {
        var index : Int!
        
        for i in 0..<self.count {
            if value == self[i] {
                index = i
            }
        }
        
        var newArray = self
        newArray.remove(at: index)
        
        return newArray
    }
}

extension Array where Element == Int {
    
    func getCommaSeparatedString() -> String {
        
        var str = ""
        for value in self {
            str = str + String.init(format: "%d,", value)
        }
        if str.hasSuffix(",") {
            str = String(str.dropLast())
        }
        
        return str
    }
    
    func removeObject(_ value: Int) -> [Int] {
        var index : Int!
        
        for i in 0..<self.count {
            if value == self[i] {
                index = i
            }
        }
        
        var newArray = self
        newArray.remove(at: index)
        
        return newArray
    }
}
