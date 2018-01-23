//
//  Requests.swift
//  StomtiOS
//
//  Created by Leonardo Cascianelli on 08/01/2018.
//

import Foundation

public protocol NetworkRequest {
    associatedtype Model
    func run(_ closure: (Model) -> Void)
}
extension NetworkRequest {
    func run(_ closure: (Model) -> Void) {
        
    }
}

public enum StomtRequest {
    case Creation(text: String, polarity: StomtObject.Polarity)
}
