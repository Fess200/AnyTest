//
//  GraphContainerRouterInput.swift
//  TestGraph
//
//  Created by Андрей Катюшин on 28/10/2018.
//  Copyright © 2018 AK. All rights reserved.
//

import Foundation

protocol GraphContainerRouterInput {
    
    func showSelectData(data:[Any], blockConvert:@escaping ((_ element: Any) -> String), moduleOutput: SelectDataModuleOutput)
    
    func showGraph(complete: @escaping ((_ moduleInput: GraphModuleInput) -> ()))

}
