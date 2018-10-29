//
//  GraphViewInput.swift
//  TestGraph
//
//  Created by Андрей Катюшин on 28/10/2018.
//  Copyright © 2018 AK. All rights reserved.
//

protocol GraphViewInput: class {

    /**
        @author Андрей Катюшин
        Setup initial state of the view
    */

    func setupInitialState()
    
    func setup(data: [ModelData])

}
