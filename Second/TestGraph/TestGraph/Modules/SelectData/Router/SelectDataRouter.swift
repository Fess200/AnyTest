class SelectDataRouter: SelectDataRouterInput {
    var transitionHandler: ViperModuleTransitionHandlerProtocol?
    
    func close() {
        transitionHandler?.closeCurrentModule(animated: true)
    }
}
