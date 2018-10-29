//
//  GraphContainerViewInput.swift
//  TestGraph
//
//  Created by Андрей Катюшин on 28/10/2018.
//  Copyright © 2018 AK. All rights reserved.
//

protocol GraphContainerViewInput: class {

    /**
        @author Андрей Катюшин
        Setup initial state of the view
    */

    func setupInitialState(dataType: DataType, debentureType: DebentureType)
    
    func setupGraph(data: [ModelData])
    
    func setupInterface(dataType: DataType)
    
    func setupInterface(debentureType: DebentureType)
    
}
