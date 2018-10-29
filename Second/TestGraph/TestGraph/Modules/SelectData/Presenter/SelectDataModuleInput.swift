
protocol SelectDataModuleInput: class {

    var moduleOutput: SelectDataModuleOutput? {get set}
    
    func configure(data: [Any], blockConvert:@escaping ((_ element: Any) -> String))
    
}
