//
//  ViperModuleTransitionHandlerProtocol.swift
//  ViperMcFlurrySwift
//
//  Created by Андрей Катюшин on 02.05.2018.
//  Copyright © 2018 Андрей Катюшин. All rights reserved.
//

import UIKit
import Swinject

class ViperModuleTransitionMap: ViperModuleTransitionMapProtocol {
    private let map = NSMapTable<AnyObject, AnyObject>(keyOptions: .weakMemory, valueOptions: .weakMemory)
    func setObject(_ anObject: AnyObject?, forKey aKey: AnyObject?) {
        map.setObject(anObject, forKey: aKey)
    }
    func object(forKey aKey: AnyObject?) -> AnyObject? {
        return map.object(forKey: aKey)
    }
}

protocol ViperModuleTransitionMapProtocol {
    func setObject(_ anObject: AnyObject?, forKey aKey: AnyObject?)
    func object(forKey aKey: AnyObject?) -> AnyObject?
}

class ViperModuleTransitionMapAssembly: Assembly, SwinjectInitAssembler {
    
    required init() {}
    
    func assemble(container: Container) {
        container.register(ViperModuleTransitionMapProtocol.self) { r in
            return ViperModuleTransitionMap()
            }.inObjectScope(.container)
    }
    
}

protocol ViperModuleTransitionHandlerProtocol {
    
    var viewController: UIViewController? {get}
    
    func performSegue(identifier: String)
    
    func openModuleUsingSegue<T>(segueIdentifier: String) -> ViperOpenModulePromise<T>
    
    func closeCurrentModule(animated: Bool)
    
}

class ViperModuleTransitionHandler: ViperModuleTransitionHandlerProtocol {
    
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func performSegue(identifier: String) {
        DispatchQueue.main.async {
            self.viewController?.performSegue(withIdentifier: identifier, sender: nil)
        }
    }
    
    func openModuleUsingSegue<T>(segueIdentifier: String) -> ViperOpenModulePromise<T> {
        let openModulePromise = ViperOpenModulePromise<T>()
        DispatchQueue.main.async {
            self.viewController?.performSegue(segueIdentifier, closure: { (segue) in
                var destinationViewController: UIViewController? = segue.destination
                if let navigationController = destinationViewController as? UINavigationController {
                    destinationViewController = navigationController.topViewController
                }
                if let viperModuleTransitionMap = assembler.resolver.resolve(ViperModuleTransitionMapProtocol.self) {
                    if let moduleInput = viperModuleTransitionMap.object(forKey: destinationViewController) as? T {
                        openModulePromise.moduleInput = moduleInput
                    }
                }
            })
        }
        return openModulePromise
    }
    
    func closeCurrentModule(animated: Bool) {
        guard let viewController = self.viewController else {
            return
        }
        
        let isInNavigationStack = viewController.parent is UINavigationController
        let hasManyControllersInStack = isInNavigationStack ? viewController.parent!.children.count > 1 : false
        
        if isInNavigationStack && hasManyControllersInStack {
            let navigationController = viewController.parent as! UINavigationController
            navigationController.popViewController(animated: animated)
        } else if viewController.presentingViewController != nil {
            viewController.dismiss(animated: animated, completion: nil)
        } else if viewController.view.superview != nil {
            viewController.removeFromParent()
            viewController.view.removeFromSuperview()
        }
    }
}
