import UIKit

internal class DCViewController: DaikuComponent {
    
    var instance: UIViewController
    
    init(instance: UIViewController) {
        self.instance = instance
    }
    
    override func make() -> UIViewController {
        return self.instance
    }
}
