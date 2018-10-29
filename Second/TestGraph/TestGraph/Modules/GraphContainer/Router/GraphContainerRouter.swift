//
//  GraphContainerRouter.swift
//  TestGraph
//
//  Created by Андрей Катюшин on 28/10/2018.
//  Copyright © 2018 AK. All rights reserved.
//

class GraphContainerRouter: GraphContainerRouterInput {
	var transitionHandler: ViperModuleTransitionHandlerProtocol?
    
    func showSelectData(data:[Any], blockConvert:@escaping ((_ element: Any) -> String), moduleOutput: SelectDataModuleOutput) {
        transitionHandler?.openModuleUsingSegue(segueIdentifier: "segueToSelectData").thenChainUsingBlock(linkBlock: { (moduleInput: SelectDataModuleInput) in
            moduleInput.configure(data: data, blockConvert: blockConvert)
            moduleInput.moduleOutput = moduleOutput
        })
    }
    
    func showGraph(complete: @escaping ((_ moduleInput: GraphModuleInput) -> ())) {
        transitionHandler?.openModuleUsingSegue(segueIdentifier: segueToGraph).thenChainUsingBlock(linkBlock: { (moduleInput: GraphModuleInput) in
            complete(moduleInput)
        })
    }
}
