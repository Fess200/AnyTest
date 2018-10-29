import UIKit

class SelectDataViewController: UIViewController, SelectDataViewInput, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var dataPicker: UIPickerView!
    
    var output: SelectDataViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: SelectDataViewInput
    func setupInitialState() {
    }
    
    func reloadData() {
        dataPicker.reloadAllComponents()
    }
    
    // MARK: Actions
    @IBAction func onTapSelect(_ sender: Any) {
        let selectRow = dataPicker.selectedRow(inComponent: 0)
        output.didTapSelect(row: selectRow)
    }
    
    @IBAction func onTapCancel(_ sender: Any) {
        output.didTapCancel()
    }
    
    // MARK: UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return output.countData()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return output.stringFor(row: row)
    }
    
}
