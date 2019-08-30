//
//  StringHelper.swift
//  
//
//  Created by Daljeet Singh on 30/08/19.
//


import UIKit

extension String {
    
    func apiJsonValue() -> String {
        return self.lowercased().replacingOccurrences(of: " ", with: "-")
    }
    
    func getNumericValue() -> Int {
        var value = self.replacingOccurrences(of: ",", with: "")
        
        let components = value.components(separatedBy: "-")
        value = components.isEmpty ? value : components.first ?? "0"
        
        return value.getInt()
    }
    
    func getInt() -> Int {
        if let n = NumberFormatter().number(from: self) {
            return Int(truncating: n)
        }
        return 0
    }
    
    func getFloat() -> Float {
        if let n = NumberFormatter().number(from: self) {
            return Float(truncating: n)
        }
        return 0
    }
    
    func getCGFloat() -> CGFloat {
        if let n = NumberFormatter().number(from: self) {
            return CGFloat(truncating: n)
        }
        return 0
    }
    
    func getDouble() -> Double {
        if let n = NumberFormatter().number(from: self) {
            return Double(truncating: n)
        }
        return 0
    }
    
    func getBool() -> Bool {
        return (self as NSString).boolValue
    }
    
    func imageURLForSize(_ size : ImageSize) -> URL? {
        if let url = URL(string: self.replacingOccurrences(of: "%%", with: size.rawValue)) {
            return url
        }
        
        return nil
    }
    
    func date(withFormat format: String = "dd/MM/yyyy HH:mm:ss") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)!
    }
    
    func isNumeric() -> Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }
}
