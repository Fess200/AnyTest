//
//  GraphViewController.swift
//  TestGraph
//
//  Created by Андрей Катюшин on 28/10/2018.
//  Copyright © 2018 AK. All rights reserved.
//

import UIKit
import SnapKit
import Charts

class GraphViewController: UIViewController, GraphViewInput {

    @IBOutlet weak var viewChart: LineChartView!
    
    var output: GraphViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: GraphViewInput
    func setupInitialState() {
    }
    
    func setup(data: [ModelData]) {
        var lineChartEntry = [ChartDataEntry]()
        for element in data {
            let chartDataEntry = ChartDataEntry(x: Double(element.day), y: element.value)
            lineChartEntry.append(chartDataEntry)
        }
        let line1 = LineChartDataSet(values: lineChartEntry, label: "Линия")
        line1.colors = [NSUIColor.blue]
        let data = LineChartData()
        data.addDataSet(line1)
        viewChart.data = data
    }
}
