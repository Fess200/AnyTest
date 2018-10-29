//
//  GraphContainerViewController.swift
//  TestGraph
//
//  Created by Андрей Катюшин on 28/10/2018.
//  Copyright © 2018 AK. All rights reserved.
//

import UIKit

class GraphContainerViewController: UIViewController, GraphContainerViewInput, ViperEmbedSegueViewContainerProtocol {

    @IBOutlet weak var buttonDataType: UIButton!
    @IBOutlet var debentureButtons: [UIButton]!
    @IBOutlet weak var containerGraph: UIView!
    
    var output: GraphContainerViewOutput!

    func viewFor(embedIdentifier: String) -> UIView {
        return containerGraph
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: GraphContainerViewInput
    func setupInitialState(dataType: DataType, debentureType: DebentureType) {
        setupInterface(dataType: dataType)
        setupInterface(debentureType: debentureType)
    }
    
    func setupGraph(data: [ModelData]) {
        
    }
    
    @IBAction func onDataType(_ sender: Any) {
        output.didTapSelectDataType()
    }
    
    @IBAction func onDebentureType(_ sender: Any) {
        let button = sender as! UIButton
        let debentureType = DebentureType(rawValue: button.tag)!
        output.didTapSelect(debentureType: debentureType)
    }
    
    func setupInterface(dataType: DataType) {
        buttonDataType.setTitle(dataType.rawValue, for: .normal)
    }
    
    func setupInterface(debentureType: DebentureType) {
        debentureButtons.forEach { (button) in
            let isSelect = button.tag == debentureType.rawValue
            button.isSelected = isSelect
        }
    }
    
}
