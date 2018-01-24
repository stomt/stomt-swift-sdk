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
var appIDIsSet = {return Shared.appID != ""}
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
    public static var appID: String = ""
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

// MARK: Public API

/**
 Set an appID for REST communication with the stomt API server.
 
 */
public func setAppID(appID: String) {
    guard appID != "" else {
        print("[Stomt/Setup] No appID provided.")
        return
    }
    Shared.appID = appID
}

/**
 Provides a widget for seamless stomt creation through SFSafariViewController.
 
 - Parameters:
    - viewController: The view controller from which to present the new SFSafariViewController instance.
 
 */
public func creationWidget(fromViewController viewController: UIViewController) throws {
    if !appIDIsSet() {
        throw StomtError.AuthorizationError.AppIDNotSet(#function)
    }
    
    #if os(iOS)
        // Widget currently unavailable in test server
        if testServer() {
            throw StomtError.APIPortabilityError.MethodNotAvailableOnServer(#function, "testing")
        }
        let creationWidget = Widget.StomtWidget(appID:Shared.appID)
        creationWidget.display(withRequest: creationWidget, fromViewController: viewController)
    #elseif os(OSX)
        throw StomtError.PortabilityError.MethodNotAvailableOnOS(#function, "Mac OS")
    #endif
}

/**
 Provides a widget for seamless feed retrieval through SFSafariViewController.
 
 - Parameters:
    - viewController: The view controller from which to present the new SFSafariViewController instance.
 
 */
public func feedWidget(fromViewController viewController: UIViewController) throws {
    if !appIDIsSet() {
        throw StomtError.AuthorizationError.AppIDNotSet(#function)
    }
    
    #if os(iOS)
        // Widget currently unavailable in test server
        if testServer() {
            throw StomtError.APIPortabilityError.MethodNotAvailableOnServer(#function, "testing")
        }
        let creationWidget = Widget.FeedWidget(appID:Shared.appID, displayCreation: true)
        creationWidget.display(withRequest: creationWidget, fromViewController: viewController)
    #elseif os(OSX)
        throw StomtError.PortabilityError.MethodNotAvailableOnOS(#function, "Mac OS")
    #endif
}
