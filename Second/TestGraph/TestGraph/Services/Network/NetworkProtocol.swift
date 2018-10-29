//
//  NetworkProtocol.swift
//  TestGraph
//
//  Created by Андрей Катюшин on 28/10/2018.
//  Copyright © 2018 Андрей Катюшин. All rights reserved.
//

import RxSwift

enum DataType: String {
    case yield = "Yield"
    case price = "Price"
}

enum DebentureType: Int {
    case debenture1
    case debenture2
}

protocol NetworkProtocol {
    
    func getData(debenture: DebentureType, data: DataType) -> Observable<[ModelData]>
    
}
