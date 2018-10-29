//
//  GraphContainerViewOutput.swift
//  TestGraph
//
//  Created by Андрей Катюшин on 28/10/2018.
//  Copyright © 2018 AK. All rights reserved.
//

import Foundation

protocol GraphContainerViewOutput {

    /**
        @author Андрей Катюшин
        Notify presenter that view is ready
    */

    func viewIsReady()
    
    func didTapSelectDataType()
    
    func didTapSelect(debentureType: DebentureType)
    
}
