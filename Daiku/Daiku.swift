import UIKit

public class Daiku {
    
    public var id: String?
    private (set) public static var globalID: String?
    private let component: () -> DaikuComponent
    
    public init(id: String? = nil, component: @autoclosure @escaping () -> DaikuComponent) {
        self.id = id
        self.component = component
    }
    
    public func make() -> UIViewController {
        Daiku.globalID = self.id
        return self.component().make()
    }
}
