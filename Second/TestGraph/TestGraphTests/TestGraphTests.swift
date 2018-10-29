//
//  TestGraphTests.swift
//  TestGraphTests
//
//  Created by Андрей Катюшин on 29/10/2018.
//  Copyright © 2018 Андрей Катюшин. All rights reserved.
//

import XCTest
import Charts

extension UIView {
    
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    
}

extension UIImage {
    
    func compare(image: UIImage) -> Bool {
        let data = self.pngData()!
        let dataImage = image.pngData()!
        return data == dataImage
    }
    
}

class TestGraphTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let bundle = Bundle(for: type(of: self))
        let fileExample = bundle.path(forResource: "example", ofType: "png")!
        let urlExample = URL(fileURLWithPath: fileExample)
        let dataExample = try? Data(contentsOf: urlExample)
        let imageExample = UIImage(data: dataExample!, scale: 3)!
        
        let view = LineChartView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        var lineChartEntry = [ChartDataEntry]()
        lineChartEntry.append(ChartDataEntry(x: 1, y: 2))
        lineChartEntry.append(ChartDataEntry(x: 4, y: 5))
        lineChartEntry.append(ChartDataEntry(x: 4, y: 6))
        lineChartEntry.append(ChartDataEntry(x: 5, y: 2))
        lineChartEntry.append(ChartDataEntry(x: 2, y: 1))
        let line1 = LineChartDataSet(values: lineChartEntry, label: "Линия")
        line1.colors = [NSUIColor.blue]
        let data = LineChartData()
        data.addDataSet(line1)
        view.data = data
        let image = view.asImage()
        let result = image.compare(image: imageExample)
        XCTAssert(result, "No compare images")
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
