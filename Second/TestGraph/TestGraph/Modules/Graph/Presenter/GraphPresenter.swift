//
//  GraphPresenter.swift
//  TestGraph
//
//  Created by Андрей Катюшин on 28/10/2018.
//  Copyright © 2018 AK. All rights reserved.
//

import Foundation

class GraphPresenter: GraphModuleInput, GraphViewOutput, GraphInteractorOutput {

    weak var view: GraphViewInput!
    var interactor: GraphInteractorInput!
    var router: GraphRouterInput!

    private var isReady = false
    private var data = [ModelData]()
    
    func viewIsReady() {
        isReady = true
        view.setup(data: data)
    }
    
    func setup(data: [ModelData]) {
        self.data = data
        if isReady {
            view.setup(data: data)
        }
    }
    
}
