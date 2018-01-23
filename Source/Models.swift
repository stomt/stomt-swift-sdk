//
//  Models.swift
//  StomtiOS
//
//  Created by Leonardo Cascianelli on 08/01/2018.
//

import Foundation

public struct StomtObject {
    
    public enum Polarity: Int {
        case wish
        case like
    }
    
    var id: String
    var text: String
    var polarity: StomtObject.Polarity

}

public struct Target {
    
    var id: String
    var displayName: String
    
}

// MARK: Protocol/JSONCodable

extension StomtObject: JSONDecodable {
    
    private enum CodingKeys: String {
        case id
        case text
        case polarity = "positive"
    }
    
    init(withJSON json: [String : Any]) throws {
        id = try json.value(forKey: CodingKeys.id.rawValue, String.self)
        text = try json.value(forKey: CodingKeys.text.rawValue, String.self)
        
        let positive = try json.value(forKey: CodingKeys.polarity.rawValue, Bool.self)
        polarity = (Polarity(rawValue:(positive == true ? 0 : 1)))!
    }
    
}

extension Target: JSONDecodable {
    
    private enum CodingKeys: String {
        case id
        case displayName = "displayname"
    }
    
    init(withJSON json: [String : Any]) throws {
        id = try json.value(forKey: CodingKeys.id.rawValue, String.self)
        displayName = try json.value(forKey: CodingKeys.displayName.rawValue, String.self)
    }
    
}
