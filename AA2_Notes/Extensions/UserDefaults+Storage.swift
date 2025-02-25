//
//  UserDefaults+Storage.swift
//  AA2_Notes
//
//  Created by Marc Ramis on 19/5/23.
//

import Foundation

//https://www.avanderlee.com/swift/user-defaults-preferences/#:~:text=User%20Defaults%20are%20the%20go,of%20the%20supported%20storage%20types.
extension UserDefaults {
    
    @discardableResult func Save(data: Encodable, key: String) -> Bool
    {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(data) {
            self.set(encoded, forKey: key)
            return true
        }
        
        return false
    }
    
    func get<T:Decodable>(key: String) -> T?
    {
        return get(T.self, key: key)
    }
    
    func get<T:Decodable>(_ t: T.Type, key: String) -> T?
    {
        if let data = self.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            if let dataObj = try? decoder.decode(T.self, from: data) {
                return dataObj
            }
        }
        return nil
    }
}

