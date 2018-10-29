//
//  GraphContainerInteractorOutput.swift
//  TestGraph
//
//  Created by Андрей Катюшин on 28/10/2018.
//  Copyright © 2018 AK. All rights reserved.
//

import Foundation

protocol GraphContainerInteractorOutput: class {

    func receive(data: [ModelData])
    
}
