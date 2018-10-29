import Foundation
import Swinject

class ServiceAssembler: Assembly, SwinjectInitAssembler {
    
    required init() {}
    
    func assemble(container: Container) {

        container.register(NetworkProtocol.self) { r in
            return Network()
        }.inObjectScope(.container)
    }
    
}
