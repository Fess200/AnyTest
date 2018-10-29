//
//  GraphContainerAssembler.swift
//  TestGraph
//
//  Created by Андрей Катюшин on 28/10/2018.
//  Copyright © 2018 AK. All rights reserved.
//

import Foundation
import Swinject

class GraphContainerAssembly: Assembly, SwinjectInitAssembler {

    required init() {}

    func assemble(container: Container) {
        container.storyboardInitCompleted(GraphContainerViewController.self) { r, viewController in
            let router = GraphContainerRouter()
            router.transitionHandler = ViperModuleTransitionHandler(viewController: viewController)

            let presenter = GraphContainerPresenter()
            presenter.view = viewController
            presenter.router = router

            let network = r.resolve(NetworkProtocol.self)!
            let interactor = GraphContainerInteractor(network: network)
            interactor.output = presenter

            presenter.interactor = interactor
            viewController.output = presenter

            let viperModuleTransitionMap = r.resolve(ViperModuleTransitionMapProtocol.self)!
            viperModuleTransitionMap.setObject(presenter, forKey: viewController)
        }
    }

}
