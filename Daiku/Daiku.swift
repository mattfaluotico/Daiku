import UIKit

public class Daiku {
    
    public let id: String?
    private let component: () -> DaikuComponent
    
    public init(id: String? = nil, component: @autoclosure @escaping () -> DaikuComponent) {
        self.id = id
        self.component = component
    }
    
    public func make() -> UIViewController {
        return self.component().make()
    }
}
