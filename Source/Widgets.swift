//
//  Widgets.swift
//  StomtiOS
//
//  Created by Leonardo Cascianelli on 19/12/2017.
//


import UIKit
import SafariServices
import Foundation

// MARK: Protocol/WidgetRequest

protocol WidgetRequest {}
extension WidgetRequest {
    
    var basePath: String {
        return Shared.baseAPI.rawValue
    }
    
    func display<Request: URLConvertible>(withRequest request: Request, fromViewController viewController: UIViewController) {
        
        do {
            let url = try request.asURL()
            let safariViewController = SFSafariViewController(url: url)
            viewController.present(safariViewController, animated: true, completion: nil)
        } catch {
            print("[Stomt/Display] \(error)")
        }
        
    }
}

// MARK: Available Widgets (https://github.com/stomt/stomt-javascript-sdk#webview--iframe)

enum Widget: URLConvertible, WidgetRequest {
    
    case StomtWidget(appID: String)
    case FeedWidget(appID: String, displayCreation: Bool)
    
    enum Keys {
        
        enum StomtWidget: String, RawRepresentable {
            case appID = "appId"
        }
        
        enum FeedWidget: String, RawRepresentable {
            case appID = "appId"
            case displayCreation = "creation"
        }
    }
    
    func asURL() throws -> URL {
        
        var path: URL
        
        switch self {
        case .StomtWidget(let appID):
            path = try (basePath + "/widget").asURL()
            path.concatenateParameters([Keys.StomtWidget.appID.rawValue:appID])
        case .FeedWidget(let appID, let displayCreation):
            path = try (basePath + "/feedwidget").asURL()
            path.concatenateParameters([Keys.StomtWidget.appID.rawValue:appID,
                                        Keys.FeedWidget.displayCreation.rawValue:displayCreation.description])
        }
        
        return path
        
    }
    
}
