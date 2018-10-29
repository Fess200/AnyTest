//
//  GraphAssembler.swift
//  TestGraph
//
//  Created by Андрей Катюшин on 28/10/2018.
//  Copyright © 2018 AK. All rights reserved.
//

import Foundation
import Swinject

class GraphAssembly: Assembly, SwinjectInitAssembler {

    required init() {}

    func assemble(container: Container) {
        container.storyboardInitCompleted(GraphViewController.self) { r, viewController in
            let router = GraphRouter()
            router.transitionHandler = ViperModuleTransitionHandler(viewController: viewController)

            let presenter = GraphPresenter()
            presenter.view = viewController
            presenter.router = router

            let interactor = GraphInteractor()
            interactor.output = presenter

            presenter.interactor = interactor
            viewController.output = presenter

            let viperModuleTransitionMap = r.resolve(ViperModuleTransitionMapProtocol.self)!
            viperModuleTransitionMap.setObject(presenter, forKey: viewController)
        }
    }

}
