import Foundation

protocol SelectDataViewOutput {

    /**
        @author Андрей Катюшин
        Notify presenter that view is ready
    */

    func viewIsReady()
    
    func countData() -> Int
    
    func stringFor(row:Int) -> String
    
    func didTapSelect(row:Int)
    
    func didTapCancel()
}
