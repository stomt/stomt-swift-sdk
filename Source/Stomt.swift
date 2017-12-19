//
//  Stomt.swift
//  StomtiOS
//
//  Created by Leonardo Cascianelli on 15/12/2017.
//


// MARK: Imports

#if os(iOS)
    import UIKit
    import SafariServices
#elseif os(OSX)
    import Cocoa
#endif
import Foundation

// MARK: Private

// Check whether the current baseAPI is the testAPI
var testServer = {return Shared.baseAPI == .testAPI}

// MARK: Public

// Represents stomt's endpoints for REST communication
// Use testAPI for any testing purpose
public enum StomtAPI: String, RawRepresentable {
    case productionAPI = "https://www.stomt.com"
    case testAPI = "https://www.test.stomt.com"
}

// Use for Framework-wide variables
public struct Shared {
    // API server used throughout all network requests
    public static var baseAPI: StomtAPI = StomtAPI.productionAPI
}

// MARK: Extension/URL - Parameter concatenation

extension URL {
    mutating func concatenateParameters(_ parameters:[String:String]) {
        var paramString = self.absoluteString + "?"
        for (key,value) in parameters {
            paramString += "\(key)=\(value)&"
        }
        self = URL(string:String(paramString.dropLast()))!
    }
}

// MARK: Protocol/URLConvertible
/*
    Ensures the implementing object can be represented in a URL form.
 */
protocol URLConvertible {
    func asURL() throws -> URL
}

extension String: URLConvertible {
    func asURL() throws -> URL {
        return URL(string:self)!
    }
}

extension URL: URLConvertible {
    func asURL() throws -> URL {
        return self
    }
}

// MARK: Public API - No AppID

/**
 Provides a widget for seamless stomt creation through SFSafariViewController.
 
 __If a non existing targetID is provided, a new target will be created.__
 
 - Parameters:
    - targetID: The target identifier/slug. Corresponds to the username of the desired page/user.
    - viewController: The view controller from which to present the new SFSafariViewController instance.
 
 */
public func creationWidget(withTargetID targetID: String, fromViewController viewController: UIViewController) throws {
    #if os(iOS)
        // Widget currently unavailable in test server
        if testServer() {
            throw StomtError.APIPortabilityError.MethodNotAvailableOnServer(#function, "testing")
        }
        let creationWidget = Widget.StomtWidget(targetID: targetID)
        creationWidget.display(withRequest: creationWidget, fromViewController: viewController)
    #elseif os(OSX)
        throw StomtError.PortabilityError.MethodNotAvailableOnOS(#function, "Mac OS")
    #endif
}

// MARK: Public API - No AppID
/**
 Provides a widget for seamless feed retrieval through SFSafariViewController.
 
 - Parameters:
    - targetID: The target identifier/slug. Corresponds to the username of the desired page/user.
    - viewController: The view controller from which to present the new SFSafariViewController instance.
 
 - Warning:
    If the provided targetID does not exist, the API will respond with an inconsistent state creation form.
 
 */
public func feedWidget(withTargetID targetID: String, fromViewController viewController: UIViewController) throws {
    #if os(iOS)
        // Widget currently unavailable in test server
        if testServer() {
            throw StomtError.APIPortabilityError.MethodNotAvailableOnServer(#function, "testing")
        }
        let creationWidget = Widget.FeedWidget(targetID: targetID, displayCreation: true)
        creationWidget.display(withRequest: creationWidget, fromViewController: viewController)
    #elseif os(OSX)
        throw StomtError.PortabilityError.MethodNotAvailableOnOS(#function, "Mac OS")
    #endif
}
