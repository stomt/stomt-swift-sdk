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
        
        let safariConfiguration = SFSafariViewController.Configuration()
        do {
            let url = try request.asURL()
            let safariViewController = SFSafariViewController(url: url, configuration: safariConfiguration)
            viewController.present(safariViewController, animated: true, completion: nil)
        } catch {
            print("[Stomt/Display] \(error)")
        }
        
    }
}

// MARK: Available Widgets (https://github.com/stomt/stomt-javascript-sdk#webview--iframe)

enum Widget: URLConvertible, WidgetRequest {
    
    case StomtWidget(targetID: String)
    case FeedWidget(targetID: String, displayCreation: Bool)
    
    enum Keys {
        enum StomtWidget: String, RawRepresentable {
            case targetID = "targetId"
        }
        
        enum FeedWidget: String, RawRepresentable {
            case targetID = "targetId"
            case displayCreation = "creation"
        }
    }
    
    func asURL() throws -> URL {
        
        var path: URL
        
        switch self {
        case let .StomtWidget(targetID):
            path = try (basePath + "/widget").asURL()
            path.concatenateParameters([Keys.StomtWidget.targetID.rawValue:targetID])
            
        case .FeedWidget(let targetID, let displayCreation):
            path = try (basePath + "/feedwidget").asURL()
            path.concatenateParameters([Keys.FeedWidget.targetID.rawValue:targetID,
                Keys.FeedWidget.displayCreation.rawValue:displayCreation.description])
        }
        
        return path
        
    }
    
}
