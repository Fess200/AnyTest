//
//  ViperEmbedSegue.swift
//  ProgressionApp
//
//  Created by Андрей Катюшин on 08.05.2018.
//  Copyright © 2018 Андрей Катюшин. All rights reserved.
//

import UIKit

class ViperEmbedSegue: UIStoryboardSegue {
    
    override func perform() {
        guard let identifier = identifier, let embeddableViewController = source as? ViperEmbedSegueViewContainerProtocol else {
            return
        }
        
        let containerView = embeddableViewController.viewFor(embedIdentifier: identifier)
        source.embed(childViewController: destination, toContainerView: containerView)
    }
    
}
