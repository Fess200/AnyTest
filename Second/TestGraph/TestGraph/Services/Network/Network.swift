//
//  Network.swift
//  TestGraph
//
//  Created by Андрей Катюшин on 28/10/2018.
//  Copyright © 2018 Андрей Катюшин. All rights reserved.
//

import RxSwift

class Network: NetworkProtocol {
    
    func getData(debenture: DebentureType, data: DataType) -> Observable<[ModelData]> {
        switch debenture {
        case .debenture1:
            switch data {
            case .price:
                return Observable.just([ModelData(day: 1, value: 7.94),
                                        ModelData(day: 2, value: 5.99),
                                        ModelData(day: 3, value: 8.2),
                                        ModelData(day: 4, value: 12.21),
                                        ModelData(day: 5, value: 14.2),
                                        ModelData(day: 6, value: 8.16)])
            case .yield:
                return Observable.just([ModelData(day: 1, value: 2.94),
                                        ModelData(day: 2, value: 3.99),
                                        ModelData(day: 3, value: 8.2),
                                        ModelData(day: 4, value: 3.21),
                                        ModelData(day: 5, value: 10.2),
                                        ModelData(day: 6, value: 11.2)])
            }
        case .debenture2:
            switch data {
            case .price:
                return Observable.just([ModelData(day: 5, value: 7.94),
                                        ModelData(day: 6, value: 5.99),
                                        ModelData(day: 7, value: 8.2),
                                        ModelData(day: 8, value: 12.21)])
            case .yield:
                return Observable.just([ModelData(day: 5, value: 1.94),
                                        ModelData(day: 6, value: 2.99),
                                        ModelData(day: 7, value: 8.23),
                                        ModelData(day: 8, value: 1.21)])
            }
        }
    }
    
}
