//
//  GraphContainerPresenter.swift
//  TestGraph
//
//  Created by Андрей Катюшин on 28/10/2018.
//  Copyright © 2018 AK. All rights reserved.
//

import Foundation

class GraphContainerPresenter: GraphContainerModuleInput, GraphContainerViewOutput, GraphContainerInteractorOutput, SelectDataModuleOutput {

    weak var view: GraphContainerViewInput!
    var interactor: GraphContainerInteractorInput!
    var router: GraphContainerRouterInput!
    
    private var graphModuleInput: GraphModuleInput!
    
    private var dataType: DataType = .price {
        didSet {
            view.setupInterface(dataType: dataType)
        }
    }
    private var debentureType: DebentureType = .debenture1 {
        didSet {
            view.setupInterface(debentureType: debentureType)
        }
    }
    
    func select(element: Any) {
        guard let type = element as? DataType else {
            return
        }
        self.dataType = type
        interactor.getData(debenture: debentureType, data: dataType)
    }

    func viewIsReady() {
        view.setupInitialState(dataType: dataType, debentureType: debentureType)
        router.showGraph { [weak self] (moduleInput) in
            guard let strongSelf = self else {
                return
            }
            strongSelf.graphModuleInput = moduleInput
            strongSelf.interactor.getData(debenture: strongSelf.debentureType,
                                          data: strongSelf.dataType)
        }
    }
    
    func receive(data: [ModelData]) {
        view.setupGraph(data: data)
        graphModuleInput.setup(data: data)
    }
    
    func didTapSelectDataType() {
        let dataSelects: [DataType] = [.price, .yield]
        router.showSelectData(data: dataSelects, blockConvert: { (type: Any) -> String in
            guard let type = type as? DataType else {
                return ""
            }
            return type.rawValue
        }, moduleOutput: self)
    }
    
    func didTapSelect(debentureType: DebentureType) {
        self.debentureType = debentureType
        interactor.getData(debenture: debentureType, data: dataType)
    }
    
}
