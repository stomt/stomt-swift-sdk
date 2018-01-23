//
//  JSONCodable.swift
//  StomtiOS
//
//  Created by Leonardo Cascianelli on 08/01/2018.
//

import Foundation

extension Dictionary where Key == String{
    
    func value<T>(forKey key: String, _ type: T.Type) throws -> T{
        guard let val = self[key] else {
            throw JSONCodableError.DecodeError.KeyNotFound(key)
        }
        guard let castedVal = val as? T else {
            throw JSONCodableError.DecodeError.TypeMismatch(key)
        }
        return castedVal
    }
    
    func valueIfPresent<T>(forKey key: String, _ type: T.Type) -> T?{
        if let val = self[key] as? T {
            return val
        }
        return nil
    }
}

protocol JSONDecodable {
    init(withJSON json: [String:Any]) throws
}

protocol JSONEncodable {
    func JSONEncode() -> [String:Any]
}

typealias JSONCodable = JSONDecodable & JSONEncodable

