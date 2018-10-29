//
//  ViperOpenModulePromise.swift
//  ViperMcFlurrySwift
//
//  Created by Андрей Катюшин on 02.05.2018.
//  Copyright © 2018 Андрей Катюшин. All rights reserved.
//

import Foundation

typealias ViperModuleLinkBlock = (_ viewController: AnyObject) -> ()

class ViperOpenModulePromise<T> {
    
    private var linkBlock: ((_ viewController: T) -> ())?
    private var linkBlockWasSet: Bool = false
    private var moduleInputWasSet: Bool = false
    
    var moduleInput: T? {
        didSet {
            moduleInputWasSet = true
            tryPerformLink()
        }
    }
    
    func thenChainUsingBlock(linkBlock: @escaping ((_ viewController: T) -> ())) {
        self.linkBlock = linkBlock
        self.linkBlockWasSet = true
        tryPerformLink()
    }
    
    private func tryPerformLink() {
        if linkBlockWasSet && moduleInputWasSet {
            performLink()
        }
    }
    
    private func performLink() {
        guard let linkBlock = linkBlock else {
            return
        }
        
        if let moduleInput = moduleInput {
            linkBlock(moduleInput)
        }
    }
    
}
