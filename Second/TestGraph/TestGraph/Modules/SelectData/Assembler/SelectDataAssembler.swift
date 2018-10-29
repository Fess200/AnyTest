import Foundation
import Swinject

class SelectDataAssembly: Assembly, SwinjectInitAssembler {

    required init() {}

    func assemble(container: Container) {
        container.storyboardInitCompleted(SelectDataViewController.self) { r, viewController in
            let router = SelectDataRouter()
            router.transitionHandler = ViperModuleTransitionHandler(viewController: viewController)

            let presenter = SelectDataPresenter()
            presenter.view = viewController
            presenter.router = router

            let interactor = SelectDataInteractor()
            interactor.output = presenter

            presenter.interactor = interactor
            viewController.output = presenter
            
            let viperModuleTransitionMap = r.resolve(ViperModuleTransitionMapProtocol.self)!
            viperModuleTransitionMap.setObject(presenter, forKey: viewController)
        }
    }

}
