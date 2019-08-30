//
//  EncodableHelper.swift
//  
//
//  Created by Daljeet Singh on 30/08/19.
//


import UIKit

extension Encodable {
    func asDictionary() -> [AnyHashable : Any]? {
        do {
            let data = try JSONEncoder().encode(self)
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [AnyHashable : Any] else {
                return nil
            }
            return dictionary
        } catch {
            print("json error: \(error)")
            return nil
        }
    }
}
