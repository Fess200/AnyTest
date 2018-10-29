import Foundation

class SelectDataPresenter: SelectDataModuleInput, SelectDataViewOutput, SelectDataInteractorOutput {

    weak var view: SelectDataViewInput!
    var interactor: SelectDataInteractorInput!
    var router: SelectDataRouterInput!
    
    weak var moduleOutput: SelectDataModuleOutput?

    var data: [Any]!
    var blockConvert:((_ element: Any) -> String)!

    func configure(data: [Any], blockConvert:@escaping ((_ element: Any) -> String)) {
        self.data = data
        self.blockConvert = blockConvert
    }
    
    func viewIsReady() {
        view.reloadData()
    }
    
    func countData() -> Int {
        return data.count
    }
    
    func stringFor(row:Int) -> String {
        let element = data[row]
        return blockConvert(element)
    }
    
    func didTapSelect(row:Int) {
        guard row < self.data.count else {
            router.close()
            return
        }
        let element = self.data[row]
        moduleOutput?.select(element: element)
        router.close()
    }
    
    func didTapCancel() {
        router.close()
    }
}
