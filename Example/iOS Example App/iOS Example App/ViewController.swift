//
//  ViewController.swift
//  iOS Example App
//
//  Created by Leonardo Cascianelli on 20/12/2017.
//  Copyright © 2017 stomt. All rights reserved.
//

import UIKit
import Stomt

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the stomt API mode - Default .testAPI
        Stomt.Shared.baseAPI = .productionAPI
        Stomt.setAppID(appID: "vRrDkEdKQwpbBzcu6Bzt6BeZn")
        // ===================
    }
    
    @IBAction func creationPressed(_ button: UIButton) {
        // Create a new stomt using the creation widget.
        // Call can throw - See Errors section in the README
        do {
            try Stomt.creationWidget(fromViewController: self)
        } catch {
            print("\(error)")
        }
        
    }
    
    @IBAction func feedPressed(_ button: UIButton) {
        // Retrieve an existing feed using the feed widget.
        // Call can throw - See Errors section in the README
        do {
            try Stomt.feedWidget(fromViewController: self)
        } catch {
            print("\(error)")
        }
        
    }
    
}
