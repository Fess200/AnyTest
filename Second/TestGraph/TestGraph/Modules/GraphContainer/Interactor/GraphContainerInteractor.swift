//
//  GraphContainerInteractor.swift
//  TestGraph
//
//  Created by Андрей Катюшин on 28/10/2018.
//  Copyright © 2018 AK. All rights reserved.
//

import RxSwift

class GraphContainerInteractor: GraphContainerInteractorInput {

    weak var output: GraphContainerInteractorOutput!

    private let network: NetworkProtocol
    
    private var disposable: Disposable?
    
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    deinit {
        disposable?.dispose()
    }
    
    func getData(debenture: DebentureType, data: DataType) {
        disposable?.dispose()
        disposable = network.getData(debenture: debenture, data: data).subscribe(onNext: { [weak self] (data) in
            guard let strongSelf = self else {
                return
            }
            strongSelf.output.receive(data: data)
        })
    }
    
}
